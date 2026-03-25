package vn.trinhdanghuy.laptopvn.services;

import org.springframework.stereotype.Service;
import vn.trinhdanghuy.laptopvn.domain.User;
import vn.trinhdanghuy.laptopvn.repository.RoleRepository;
import vn.trinhdanghuy.laptopvn.repository.UserRepository;

import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public String handleHello() {
        return "Hello from service";
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        if (user.getRole() != null) {
            vn.trinhdanghuy.laptopvn.domain.Role role = this.roleRepository.findByName(user.getRole().getName());
            if (role != null) {
                user.setRole(role);
            }
        }
        return this.userRepository.save(user);
    }

    public User getUserById(long id) {
        return this.userRepository.findUserById(id);
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public boolean checkEmailExists(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
