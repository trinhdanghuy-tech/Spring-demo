package vn.trinhdanghuy.laptopvn.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import jakarta.validation.Valid;

import vn.trinhdanghuy.laptopvn.domain.Product;
import vn.trinhdanghuy.laptopvn.services.ProductService;
import vn.trinhdanghuy.laptopvn.services.UploadService;
import java.util.List;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String createProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult result,
            @RequestParam("imageFile") MultipartFile imageFile) {

        if (result.hasErrors()) {
            return "admin/product/create";
        }
        String imageProduct = this.uploadService.handleSaveUploadFile(imageFile, "product");
        product.setImage(imageProduct);
        try {
            this.productService.handleSaveProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error creating product: " + e.getMessage());
            return "admin/product/create";
        }
        return "redirect:/admin/product";
    }

}
