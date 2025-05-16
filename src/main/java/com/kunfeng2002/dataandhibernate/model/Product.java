package com.kunfeng2002.dataandhibernate.model;

import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Product {
    @Id
    private int Pid;
    private String Pname;
    private double Pprice;

    public Product(int pid, String pname, double pprice) {
        Pid = pid;
        Pname = pname;
        Pprice = pprice;
    }
}
