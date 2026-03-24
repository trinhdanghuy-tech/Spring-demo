package vn.trinhdanghuy.laptopvn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.trinhdanghuy.laptopvn.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);

    List<Product> findAll();

    List<Product> findByFactory(String factory);

    Product findById(long id);

    void deleteById(long id);
}
