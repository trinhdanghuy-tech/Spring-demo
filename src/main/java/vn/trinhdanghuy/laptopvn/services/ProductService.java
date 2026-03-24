package vn.trinhdanghuy.laptopvn.services;

import org.springframework.stereotype.Service;

import vn.trinhdanghuy.laptopvn.repository.ProductRepository;
import java.util.List;
import vn.trinhdanghuy.laptopvn.domain.Product;
import java.util.Optional;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public List<Product> getProductsByFactory(String factory) {
        return this.productRepository.findByFactory(factory);
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }
}
