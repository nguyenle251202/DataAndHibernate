package com.kunfeng2002.dataandhibernate.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(schema = "product")
public class Product {
    @Id
    private int Pid;
    private String Pname;
    private double Pprice;
    private double PtotalQuantity;
}
