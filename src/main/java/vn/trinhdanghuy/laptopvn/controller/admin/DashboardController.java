package vn.trinhdanghuy.laptopvn.controller.admin;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import vn.trinhdanghuy.laptopvn.domain.Oder;
import vn.trinhdanghuy.laptopvn.domain.Product;
import vn.trinhdanghuy.laptopvn.domain.User;
import vn.trinhdanghuy.laptopvn.services.OderService;
import vn.trinhdanghuy.laptopvn.services.ProductService;
import vn.trinhdanghuy.laptopvn.services.UserService;

import java.util.Comparator;
import java.util.List;

@Controller
public class DashboardController {
    private final UserService userService;
    private final ProductService productService;
    private final OderService oderService;

    public DashboardController(UserService userService, ProductService productService, OderService oderService) {
        this.userService = userService;
        this.productService = productService;
        this.oderService = oderService;
    }

    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        List<User> users = this.userService.getAllUsers();
        List<Product> products = this.productService.getAllProducts();
        List<Oder> orders = this.oderService.getAllOrders();

        double totalRevenue = orders.stream()
                .filter(order -> !"CANCELLED".equalsIgnoreCase(order.getStatus()))
                .mapToDouble(Oder::getTotalPrice)
                .sum();

        long pendingOrders = orders.stream()
                .filter(order -> "PENDING".equalsIgnoreCase(order.getStatus()))
                .count();

        long lowStockProducts = products.stream()
                .filter(product -> product.getQuantity() > 0 && product.getQuantity() <= 5)
                .count();

        long outOfStockProducts = products.stream()
                .filter(product -> product.getQuantity() <= 0)
                .count();

        long totalUnitsSold = products.stream()
                .mapToLong(Product::getSold)
                .sum();

        List<Product> topProducts = products.stream()
                .sorted(Comparator.comparingLong(Product::getSold).reversed()
                        .thenComparing(Product::getName))
                .limit(5)
                .toList();

        List<Product> inventoryAlerts = products.stream()
                .filter(product -> product.getQuantity() <= 5)
                .sorted(Comparator.comparingLong(Product::getQuantity)
                        .thenComparing(Product::getName))
                .limit(5)
                .toList();

        List<Oder> recentOrders = orders.stream()
                .limit(6)
                .toList();

        model.addAttribute("userCount", users.size());
        model.addAttribute("productCount", products.size());
        model.addAttribute("orderCount", orders.size());
        model.addAttribute("totalRevenue", totalRevenue);
        model.addAttribute("pendingOrders", pendingOrders);
        model.addAttribute("lowStockProducts", lowStockProducts);
        model.addAttribute("outOfStockProducts", outOfStockProducts);
        model.addAttribute("totalUnitsSold", totalUnitsSold);
        model.addAttribute("topProducts", topProducts);
        model.addAttribute("inventoryAlerts", inventoryAlerts);
        model.addAttribute("recentOrders", recentOrders);
        return "admin/dashboard/show";
    }
}
