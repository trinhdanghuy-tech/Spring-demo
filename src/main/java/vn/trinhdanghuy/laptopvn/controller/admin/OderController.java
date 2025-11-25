package vn.trinhdanghuy.laptopvn.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OderController {

    @GetMapping("/admin/oder")
    public String getOder() {
        return "admin/oder/show";
    }
}
