package vn.trinhdanghuy.laptopvn.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import vn.trinhdanghuy.laptopvn.domain.Role;
import vn.trinhdanghuy.laptopvn.domain.User;
import vn.trinhdanghuy.laptopvn.domain.dto.registerDTO;
import vn.trinhdanghuy.laptopvn.services.UserService;

@Controller
public class AuthController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public AuthController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    // Register
    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new registerDTO());
        return "client/auth/register";
    }

    // Post Register
    @PostMapping("/register")
    public String postRegister(Model model,
            @ModelAttribute("registerUser") @Valid registerDTO registerDTO,
            BindingResult result) {

        if (result.hasErrors()) {
            return "client/auth/register";
        }

        // Chuyển DTO sang User entity, Mapper
        User user = new User();
        user.setFullName(registerDTO.getFullName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(this.passwordEncoder.encode(registerDTO.getPassword()));

        // Set default role USER
        Role userRole = new Role();
        userRole.setName("USER");
        user.setRole(userRole);

        this.userService.handleSaveUser(user);

        return "redirect:/login?success";
    }
}
