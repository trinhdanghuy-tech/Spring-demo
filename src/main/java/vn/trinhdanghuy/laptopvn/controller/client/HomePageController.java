package vn.trinhdanghuy.laptopvn.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.ui.Model;
import vn.trinhdanghuy.laptopvn.domain.Product;
import vn.trinhdanghuy.laptopvn.services.ProductService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomePageController {

    private final ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomePage(Model model, HttpServletRequest request) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/home/show";
    }

    @GetMapping("/access-denied")
    public String getAccessDeniedPage() {
        return "client/auth/access-denied";
    }
}
