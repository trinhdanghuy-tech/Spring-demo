package vn.trinhdanghuy.laptopvn.services.validator;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.trinhdanghuy.laptopvn.domain.dto.registerDTO;
import vn.trinhdanghuy.laptopvn.services.UserService;

@Service
public class RegisterCheckedValidator implements ConstraintValidator<RegisterChecked, registerDTO> {

    private final UserService userService;

    public RegisterCheckedValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(registerDTO user, ConstraintValidatorContext context) {
        boolean valid = true;

        // Check confirm password
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Mật khẩu xác nhận không khớp")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation();
            valid = false;
        }

        // Check email exists
        if (this.userService.checkEmailExists(user.getEmail())) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Email đã tồn tại")
                    .addPropertyNode("email")
                    .addConstraintViolation();
            valid = false;
        }

        return valid;
    }
}
