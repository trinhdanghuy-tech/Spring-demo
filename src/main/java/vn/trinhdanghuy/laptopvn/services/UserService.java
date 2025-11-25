package vn.trinhdanghuy.laptopvn.services;

import org.springframework.stereotype.Service;
import vn.trinhdanghuy.laptopvn.domain.User;
import vn.trinhdanghuy.laptopvn.repository.UserRepository;

import java.util.List;

    @Service
    public class UserService {

        private final UserRepository userRepository;

        public UserService(UserRepository userRepository) {
            this.userRepository = userRepository;
        }

        public String handleHello() {
            return "Hello from service";
        }

        public List<User> getAllUsers() {
            return this.userRepository.findAll();
        }

        public List<User> getUsersByEmail(String email) {
            return this.userRepository.findByEmail(email);
        }

        public User handleSaveUser(User user) {
            return this.userRepository.save(user);
        }

        public User getUserById(long id) {
            return this.userRepository.findById(id);
        }

        public void deleteUserById(long id) {
            this.userRepository.deleteById(id);
        }
    }

