package vn.trinhdanghuy.laptopvn.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.trinhdanghuy.laptopvn.domain.Product;
import vn.trinhdanghuy.laptopvn.domain.dto.Cart;
import vn.trinhdanghuy.laptopvn.domain.dto.CartDetail;
import vn.trinhdanghuy.laptopvn.services.ProductService;

@Controller
public class CartController {

    private final ProductService productService;

    public CartController(ProductService productService) {
        this.productService = productService;
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
            product.getImage()
        );
        cart.addItem(cartDetail);

        // Lưu lại vào session
        session.setAttribute("cart", cart);
        session.setAttribute("cartTotal", cart.getTotalQuantity());

        // Quay lại trang trước đó
        String referer = request.getHeader("Referer");
        if (referer != null) {
            return "redirect:" + referer;
        }
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        model.addAttribute("cart", cart);
        model.addAttribute("cartTotalPrice", cart.getTotalPrice());
        return "client/cart/show";
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
}
