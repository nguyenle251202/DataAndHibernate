package com.kunfeng2002.dataandhibernate.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Transient;
import lombok.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
    private Customer Ocustomer;
    @Transient
    private OrderItem Oorderitem;
    private double Ototalprice;
    private String month;

    public Order(String month, double totalpriceMonth) {
        this.month = month;
        this.setOtotalprice(totalpriceMonth);
    }
}
