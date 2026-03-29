package vn.trinhdanghuy.laptopvn.domain.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;
    private List<CartDetail> items = new ArrayList<>();

    public List<CartDetail> getItems() { return items; }
    public void setItems(List<CartDetail> items) { this.items = items; }

    public void addItem(CartDetail newItem) {
        for (CartDetail item : items) {
            if (item.getProductId() == newItem.getProductId()) {
                item.setQuantity(item.getQuantity() + newItem.getQuantity());
                return;
            }
        }
        items.add(newItem);
    }

    public void removeItem(long productId) {
        items.removeIf(item -> item.getProductId() == productId);
    }

    public long getTotalQuantity() {
        long total = 0;
        for (CartDetail item : items) {
            total += item.getQuantity();
        }
        return total;
    }

    public double getTotalPrice() {
        double total = 0;
        for (CartDetail item : items) {
            total += item.getSubTotal();
        }
        return total;
    }
}

