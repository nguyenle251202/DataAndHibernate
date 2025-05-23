package com.kunfeng2002.dataandhibernate.dao;

import com.kunfeng2002.dataandhibernate.model.Product;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public interface ProductDAO {

    List<Product> productList() throws DataAccessException;

    Product getProductById(int id) throws DataAccessException;

    @Transactional
    void addProduct(List<Product> product) throws DataAccessException;

    @Transactional
    void updateProduct(List<Product> product) throws DataAccessException;

    void deleteProduct(int id) throws DataAccessException;

    List<Product> HightestList() throws DataAccessException;
}
