package vn.trinhdanghuy.laptopvn.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "oder_details")
public class OderDetail {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;

    private long quantity;
    private double price;

    @ManyToOne
    @JoinColumn(name = "oder_id")
    private Oder oder;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
