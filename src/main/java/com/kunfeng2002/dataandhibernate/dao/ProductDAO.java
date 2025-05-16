package com.kunfeng2002.dataandhibernate.dao;

import com.kunfeng2002.dataandhibernate.model.Product;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface ProductDAO {

    List<Product> productList();

    Product getProductById(int id);

    void addProduct(Product product);

    void updateProduct(Product product);

    void deleteProduct(int id);
}
