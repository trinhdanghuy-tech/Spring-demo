package vn.trinhdanghuy.laptopvn.domain.dto;

import java.io.Serializable;

public class CartDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    private long productId;
    private String name;
    private double price;
    private long quantity;
    private String image;

    public CartDetail() {}

    public CartDetail(long productId, String name, double price, long quantity, String image) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public long getProductId() { return productId; }
    public void setProductId(long productId) { this.productId = productId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public long getQuantity() { return quantity; }
    public void setQuantity(long quantity) { this.quantity = quantity; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public double getSubTotal() {
        return this.price * this.quantity;
    }
}

