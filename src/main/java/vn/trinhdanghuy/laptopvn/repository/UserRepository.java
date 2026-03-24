package vn.trinhdanghuy.laptopvn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.trinhdanghuy.laptopvn.domain.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);

    List<User> findByEmail(String email);

    List<User> findAll();

    @org.springframework.data.jpa.repository.Query("SELECT u FROM User u WHERE u.id = :id")
    User findUserById(@org.springframework.data.repository.query.Param("id") long id);

    void deleteById(long id);
}
