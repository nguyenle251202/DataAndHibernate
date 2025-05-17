package com.kunfeng2002.dataandhibernate.dao;

import com.kunfeng2002.dataandhibernate.model.Product;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;

@Service
public interface ProductDAO {

    List<Product> productList();

    Product getProductById(int id);

    @Transactional
    void addProduct(Product product) throws SQLException;

    @Transactional
    void updateProduct(Product product);

    void deleteProduct(int id);
}
