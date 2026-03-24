package vn.trinhdanghuy.laptopvn.controller.admin;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import vn.trinhdanghuy.laptopvn.domain.User;
import vn.trinhdanghuy.laptopvn.services.UploadService;
import vn.trinhdanghuy.laptopvn.services.UserService;

import java.util.List;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService,
            UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    /* Trang chinh */
    @RequestMapping("/")
    public String getHomePage(Model model) {

        String test = this.userService.handleHello();
        model.addAttribute("eric", test);
        return "hello";
    }

    /* Show all users */
    @RequestMapping(value = "/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users1", users);
        return "admin/user/show";
    }

    /* Show detail user */
    @RequestMapping(value = "/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    /* Show create user page */
    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") User hoidanit,
            BindingResult bindingResult,
            @RequestParam("huyhuyFile") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashedPassword = passwordEncoder.encode(hoidanit.getPassword());
        hoidanit.setAvatar(avatar);
        hoidanit.setPassword(hashedPassword);
        try {
            this.userService.handleSaveUser(hoidanit);
        } catch (Exception e) {
            // Log error (optional) and return to form with error?
            // Since we don't have a standardized error display, strictly returning to form
            // might hide the specific DB error
            // but it prevents the 500 crash page.
            // Ideally we should add a global error message to the model.
            e.printStackTrace();
            model.addAttribute("error", "Error creating user: " + e.getMessage());
            return "admin/user/create";
        }
        return "redirect:/admin/user";
    }

    /* Update user */
    @RequestMapping(value = "/admin/user/update_user/{id}")
    public String updateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "/admin/user/update_user";
    }

    @PostMapping("/admin/user/update_user")
    public String postUpdateUserPage(Model model, @ModelAttribute("newUser") User hoidanit) {
        User currentUser = this.userService.getUserById(hoidanit.getId());
        if (currentUser != null) {
            currentUser.setFullName(hoidanit.getFullName());
            currentUser.setAddress(hoidanit.getAddress());
            currentUser.setPhone(hoidanit.getPhone());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // Hiển thị trang confirm delete
    @GetMapping("/admin/user/delete_user/{id}")
    public String getDeleteUserPage(@PathVariable long id, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete_user"; // JSP confirm delete
    }

    // Xử lý POST khi nhấn nút Delete
    @PostMapping("/admin/user/delete_user")
    public String postDeleteUser(@ModelAttribute("newUser") User user) {
        // Xóa user theo id
        userService.deleteUserById(user.getId());
        return "redirect:/admin/user"; // Quay về trang danh sách
    }

}
