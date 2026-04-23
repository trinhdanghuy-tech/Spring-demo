package vn.trinhdanghuy.laptopvn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.trinhdanghuy.laptopvn.domain.Oder;
import vn.trinhdanghuy.laptopvn.domain.User;

import java.util.List;

@Repository
public interface OderRepository extends JpaRepository<Oder, Long> {
    List<Oder> findAllByOrderByCreatedAtDesc();

    List<Oder> findByUserOrderByCreatedAtDesc(User user);
}
