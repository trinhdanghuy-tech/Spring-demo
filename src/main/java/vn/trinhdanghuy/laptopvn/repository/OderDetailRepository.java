package vn.trinhdanghuy.laptopvn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.trinhdanghuy.laptopvn.domain.OderDetail;

@Repository
public interface OderDetailRepository extends JpaRepository<OderDetail, Long> {
}
