package vn.trinhdanghuy.laptopvn.services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.trinhdanghuy.laptopvn.domain.Oder;
import vn.trinhdanghuy.laptopvn.domain.OderDetail;
import vn.trinhdanghuy.laptopvn.domain.Product;
import vn.trinhdanghuy.laptopvn.domain.User;
import vn.trinhdanghuy.laptopvn.domain.dto.Cart;
import vn.trinhdanghuy.laptopvn.domain.dto.CartDetail;
import vn.trinhdanghuy.laptopvn.domain.dto.CheckoutRequest;
import vn.trinhdanghuy.laptopvn.repository.OderDetailRepository;
import vn.trinhdanghuy.laptopvn.repository.OderRepository;
import vn.trinhdanghuy.laptopvn.repository.ProductRepository;

import java.util.List;

@Service
public class OderService {
    private final OderRepository oderRepository;
    private final OderDetailRepository oderDetailRepository;
    private final ProductRepository productRepository;

    public OderService(OderRepository oderRepository,
            OderDetailRepository oderDetailRepository,
            ProductRepository productRepository) {
        this.oderRepository = oderRepository;
        this.oderDetailRepository = oderDetailRepository;
        this.productRepository = productRepository;
    }

    public List<Oder> getAllOrders() {
        return this.oderRepository.findAllByOrderByCreatedAtDesc();
    }

    public List<Oder> getOrdersByUser(User user) {
        if (user == null) {
            return List.of();
        }
        return this.oderRepository.findByUserOrderByCreatedAtDesc(user);
    }

    public Oder getOrderById(long id) {
        return this.oderRepository.findById(id).orElse(null);
    }

    public Oder updateStatus(long id, String status) {
        Oder order = getOrderById(id);
        if (order == null) {
            return null;
        }
        order.setStatus(status);
        return this.oderRepository.save(order);
    }

    @Transactional
    public Oder placeOrder(Cart cart, CheckoutRequest checkoutRequest, User user) {
        if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
            throw new IllegalStateException("Giỏ hàng đang trống");
        }

        Oder order = new Oder();
        order.setUser(user);
        order.setReceiverName(checkoutRequest.getFullName());
        order.setReceiverPhone(checkoutRequest.getPhone());
        order.setReceiverAddress(checkoutRequest.getAddress());
        order.setPaymentMethod(checkoutRequest.getPaymentMethod());
        order.setNote(checkoutRequest.getNote());
        order.setStatus("PENDING");

        double totalPrice = 0;
        for (CartDetail item : cart.getItems()) {
            Product product = this.productRepository.findById(item.getProductId());
            if (product == null) {
                throw new IllegalStateException("Sản phẩm không còn tồn tại");
            }
            if (item.getQuantity() > product.getQuantity()) {
                throw new IllegalStateException("Sản phẩm " + product.getName() + " không đủ tồn kho");
            }
            totalPrice += product.getPrice() * item.getQuantity();
        }

        order.setTotalPrice(totalPrice);
        Oder savedOrder = this.oderRepository.save(order);

        for (CartDetail item : cart.getItems()) {
            Product product = this.productRepository.findById(item.getProductId());

            OderDetail detail = new OderDetail();
            detail.setOder(savedOrder);
            detail.setProduct(product);
            detail.setQuantity(item.getQuantity());
            detail.setPrice(product.getPrice());
            this.oderDetailRepository.save(detail);

            product.setQuantity(product.getQuantity() - item.getQuantity());
            product.setSold(product.getSold() + item.getQuantity());
            this.productRepository.save(product);
        }

        return savedOrder;
    }
}
