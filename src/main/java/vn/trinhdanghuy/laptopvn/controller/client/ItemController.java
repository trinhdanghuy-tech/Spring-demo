package vn.trinhdanghuy.laptopvn.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ItemController {

    @GetMapping("/product/{id}")
    public String getProductDetail(Model model, @PathVariable("id") long id) {
        // Truyền ID sang view để kiểm tra
        model.addAttribute("id", id);
        return "client/product/detail";
    }

}
