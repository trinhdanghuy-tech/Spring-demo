package vn.trinhdanghuy.laptopvn.controller.client;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.trinhdanghuy.laptopvn.domain.User;
import vn.trinhdanghuy.laptopvn.services.OderService;
import vn.trinhdanghuy.laptopvn.services.UserService;

@Controller
public class OrderPageController {
    private final OderService oderService;
    private final UserService userService;

    public OrderPageController(OderService oderService, UserService userService) {
        this.oderService = oderService;
        this.userService = userService;
    }

    @GetMapping("/my-orders")
    public String getMyOrdersPage(Authentication authentication, Model model) {
        if (authentication == null) {
            return "redirect:/login";
        }

        User user = this.userService.getUserByEmail(authentication.getName());
        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("orders", this.oderService.getOrdersByUser(user));
        return "client/order/show";
    }
}
