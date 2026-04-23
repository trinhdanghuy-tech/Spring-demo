package vn.trinhdanghuy.laptopvn.controller.client;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.net.URI;
import java.net.URISyntaxException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import vn.trinhdanghuy.laptopvn.domain.Product;
import vn.trinhdanghuy.laptopvn.domain.User;
import vn.trinhdanghuy.laptopvn.domain.dto.Cart;
import vn.trinhdanghuy.laptopvn.domain.dto.CartDetail;
import vn.trinhdanghuy.laptopvn.domain.dto.CheckoutRequest;
import vn.trinhdanghuy.laptopvn.domain.Oder;
import vn.trinhdanghuy.laptopvn.services.OderService;
import vn.trinhdanghuy.laptopvn.services.ProductService;
import vn.trinhdanghuy.laptopvn.services.UserService;

@Controller
public class CartController {

    private final ProductService productService;
    private final OderService oderService;
    private final UserService userService;

    public CartController(ProductService productService, OderService oderService, UserService userService) {
        this.productService = productService;
        this.oderService = oderService;
        this.userService = userService;
    }

    @PostMapping("/cart/add")
    public String addToCart(@RequestParam("productId") long productId,
            @RequestParam(value = "quantity", defaultValue = "1") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession();

        Product product = this.productService.getProductById(productId);
        if (product == null) {
            return "redirect:/";
        }

        // Lấy cart từ session hoặc tạo mới
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        // Thêm sản phẩm vào giỏ
        CartDetail cartDetail = new CartDetail(
                product.getId(),
                product.getName(),
                product.getPrice(),
                quantity,
                product.getImage());
        cart.addItem(cartDetail);

        // Lưu lại vào session
        session.setAttribute("cart", cart);
        session.setAttribute("cartTotal", cart.getTotalQuantity());

        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isBlank()) {
            try {
                URI refererUri = new URI(referer);
                String redirectPath = refererUri.getPath();
                String query = refererUri.getQuery();

                if (redirectPath != null && !redirectPath.isBlank() && !"/cart/add".equals(redirectPath)) {
                    if (query != null && !query.isBlank()) {
                        redirectPath += "?" + query;
                    }
                    return "redirect:" + redirectPath;
                }
            } catch (URISyntaxException ignored) {
                // Fallback to cart page when Referer is malformed.
            }
        }
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        if (!model.containsAttribute("checkoutForm")) {
            model.addAttribute("checkoutForm", buildCheckoutRequest(request.getUserPrincipal() != null
                    ? request.getUserPrincipal().getName()
                    : null));
        }
        model.addAttribute("cart", cart);
        model.addAttribute("cartTotalPrice", cart.getTotalPrice());
        return "client/cart/show";
    }

    @PostMapping("/cart/checkout")
    public String checkout(@Valid @ModelAttribute("checkoutForm") CheckoutRequest checkoutRequest,
            BindingResult bindingResult,
            Model model,
            HttpServletRequest request,
            Authentication authentication) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            model.addAttribute("checkoutError", "Giỏ hàng đang trống, vui lòng chọn sản phẩm trước khi thanh toán.");
            model.addAttribute("cart", new Cart());
            model.addAttribute("cartTotalPrice", 0);
            return "client/cart/show";
        }

        if (bindingResult.hasErrors()) {
            model.addAttribute("cart", cart);
            model.addAttribute("cartTotalPrice", cart.getTotalPrice());
            return "client/cart/show";
        }

        User user = resolveCurrentUser(authentication);
        try {
            Oder order = this.oderService.placeOrder(cart, checkoutRequest, user);
            session.setAttribute("cart", new Cart());
            session.setAttribute("cartTotal", 0L);
            session.setAttribute("lastOrderId", order.getId());
            return "redirect:/checkout/success";
        } catch (IllegalStateException exception) {
            model.addAttribute("cart", cart);
            model.addAttribute("cartTotalPrice", cart.getTotalPrice());
            model.addAttribute("checkoutError", exception.getMessage());
            return "client/cart/show";
        }
    }

    @GetMapping("/checkout/success")
    public String getCheckoutSuccessPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object lastOrderId = session.getAttribute("lastOrderId");
        if (!(lastOrderId instanceof Long orderId)) {
            return "redirect:/cart";
        }

        Oder order = this.oderService.getOrderById(orderId);
        if (order == null) {
            return "redirect:/cart";
        }

        model.addAttribute("order", order);
        return "client/cart/success";
    }

    @PostMapping("/cart/remove")
    public String removeFromCart(@RequestParam("productId") long productId,
            HttpServletRequest request) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.removeItem(productId);
            session.setAttribute("cart", cart);
            session.setAttribute("cartTotal", cart.getTotalQuantity());
        }
        return "redirect:/cart";
    }

    @PostMapping("/cart/update-quantity")
    public String updateQuantity(@RequestParam("productId") long productId,
            @RequestParam("change") long change,
            HttpServletRequest request) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.updateItemQuantity(productId, change);
            session.setAttribute("cart", cart);
            session.setAttribute("cartTotal", cart.getTotalQuantity());
        }
        return "redirect:/cart";
    }

    private CheckoutRequest buildCheckoutRequest(String email) {
        CheckoutRequest checkoutRequest = new CheckoutRequest();
        if (email == null || email.isBlank()) {
            return checkoutRequest;
        }

        User user = this.userService.getUserByEmail(email);
        if (user == null) {
            return checkoutRequest;
        }

        checkoutRequest.setFullName(user.getFullName());
        checkoutRequest.setPhone(user.getPhone());
        checkoutRequest.setAddress(user.getAddress());
        checkoutRequest.setPaymentMethod("Thanh toán khi nhận hàng");
        return checkoutRequest;
    }

    private User resolveCurrentUser(Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()
                || authentication instanceof AnonymousAuthenticationToken) {
            return null;
        }
        return this.userService.getUserByEmail(authentication.getName());
    }
}
