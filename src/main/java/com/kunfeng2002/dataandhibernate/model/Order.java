package com.kunfeng2002.dataandhibernate.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
public class Order {

    @Id
    private int Oid;
    private LocalDate Odate;
    @Transient
    @ManyToOne
    private Customer Ocustomer;
    @Transient
    @OneToMany()
    private List<OrderItem> Oorderitem;
    private double Ototalprice;
    private String month;

    public Order(String month, double totalpriceMonth) {
        this.month = month;
        this.setOtotalprice(totalpriceMonth);
    }
}
