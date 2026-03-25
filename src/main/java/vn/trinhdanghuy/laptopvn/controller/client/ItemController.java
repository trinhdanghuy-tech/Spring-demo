package vn.trinhdanghuy.laptopvn.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.trinhdanghuy.laptopvn.domain.Product;
import vn.trinhdanghuy.laptopvn.services.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(Model model, @PathVariable("id") long id) {
        Product product = this.productService.getProductById(id);
        if (product == null) {
            return "redirect:/products";
        }
        model.addAttribute("product", product);
        model.addAttribute("id", id);

        // Sản phẩm cùng hãng (trừ sản phẩm hiện tại)
        List<Product> relatedProducts = this.productService.getProductsByFactory(product.getFactory());
        relatedProducts.removeIf(p -> p.getId() == id);
        model.addAttribute("relatedProducts", relatedProducts);

        return "client/product/detail";
    }
}
