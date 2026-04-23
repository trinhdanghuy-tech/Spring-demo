package vn.trinhdanghuy.laptopvn.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.trinhdanghuy.laptopvn.services.OderService;

@Controller
public class OderController {
    private final OderService oderService;

    public OderController(OderService oderService) {
        this.oderService = oderService;
    }

    @GetMapping("/admin/oder")
    public String getOder(Model model) {
        model.addAttribute("orders", this.oderService.getAllOrders());
        return "admin/oder/show";
    }

    @PostMapping("/admin/oder/{id}/status")
    public String updateOrderStatus(@PathVariable("id") long id,
            @RequestParam("status") String status) {
        this.oderService.updateStatus(id, status);
        return "redirect:/admin/oder";
    }
}
