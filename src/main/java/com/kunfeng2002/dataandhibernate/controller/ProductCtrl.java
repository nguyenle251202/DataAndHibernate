package com.kunfeng2002.dataandhibernate.controller;

import com.kunfeng2002.dataandhibernate.dao.ProductDAO;
import com.kunfeng2002.dataandhibernate.model.Product;
import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ProductCtrl {

    private final ProductDAO productDAO;

    public ProductCtrl(ProductDAO productDAO) throws DataAccessException {
        this.productDAO = productDAO;
    }

    @GetMapping("/product")
    public List<Product> getProducts() throws DataAccessException{
        List<Product> products = productDAO.productList();
        return products;
    }

    @PostMapping("/product/{id}")
    public Product getProduct(@PathVariable int id) throws DataAccessException{
        Product product = productDAO.getProductById(id);
        return product;
    }

    @PostMapping("/product/add")
    public ResponseEntity<Product> addProduct(@RequestBody Product product) throws DataAccessException{
        productDAO.addProduct(product);
        return ResponseEntity.ok(product);
        }

    @PostMapping("/product/update")
    public ResponseEntity<Product> updateProduct(@RequestBody Product product) throws DataAccessException{
        productDAO.updateProduct(product);
        return ResponseEntity.ok(product);
    }

    @PostMapping("/product/delete/{id}")
    public void deleteProduct(@PathVariable int id) throws DataAccessException{
        productDAO.deleteProduct(id);
    }
}
