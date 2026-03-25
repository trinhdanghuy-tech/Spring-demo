package vn.trinhdanghuy.laptopvn.domain.dto;

import vn.trinhdanghuy.laptopvn.services.validator.RegisterChecked;
import vn.trinhdanghuy.laptopvn.services.validator.StrongPassword;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@RegisterChecked
public class registerDTO {
    @NotEmpty(message = "Họ tên không được để trống")
    @Size(min = 2, message = "Họ tên phải có ít nhất 2 ký tự")
    private String fullName;

    @NotEmpty(message = "Email không được để trống")
    @Email(message = "Email không hợp lệ")
    private String email;

    @NotEmpty(message = "Mật khẩu không được để trống")
    @StrongPassword(message = "Mật khẩu phải có ít nhất 8 ký tự, 1 chữ hoa, 1 chữ thường, 1 số và 1 ký tự đặc biệt")
    private String password;

    @NotEmpty(message = "Xác nhận mật khẩu không được để trống")
    private String confirmPassword;

    public registerDTO() {
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
