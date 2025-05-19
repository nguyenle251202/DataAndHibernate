package com.kunfeng2002.dataandhibernate.model;

import jakarta.persistence.Entity;
import lombok.*;
import org.springframework.web.bind.annotation.GetMapping;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderItem {
    private Product product;
    private double quantity;
    private double price;
}
