package vn.trinhdanghuy.laptopvn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.trinhdanghuy.laptopvn.domain.Role;
import vn.trinhdanghuy.laptopvn.domain.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);

    List<User> findByEmail(String email);

    List<User> findAll();

    User findById(long id);

    void deleteById(long id);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Role r WHERE r.name = :name")
    vn.trinhdanghuy.laptopvn.domain.Role findRoleByName(
            @org.springframework.data.repository.query.Param("name") String name);
}
