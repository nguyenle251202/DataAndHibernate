package com.kunfeng2002.dataandhibernate.controller.jdbc;

import com.kunfeng2002.dataandhibernate.dao.ProductDAO;
import com.kunfeng2002.dataandhibernate.model.Product;
import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/jdbc/product")
public class ProductCtrl {

    private final ProductDAO productDAO;

    public ProductCtrl(ProductDAO productDAO) throws DataAccessException {
        this.productDAO = productDAO;
    }

    @GetMapping("/getall")
    public List<Product> getProducts() throws DataAccessException{
        List<Product> products = productDAO.productList();
        return products;
    }

    @PostMapping("/get/{id}")
    public Product getProduct(@PathVariable int id) throws DataAccessException{
        Product product = productDAO.getProductById(id);
        return product;
    }

    @PostMapping("/add")
    public ResponseEntity<Product> addProduct(@RequestBody List<Product> product){
        productDAO.addProduct(product);
        return null;
    }

    @PostMapping("/update")
    public ResponseEntity<Product> updateProduct(@RequestBody List<Product> product) throws DataAccessException{
        productDAO.updateProduct(product);
        return null;
    }

    @PostMapping("/delete/{id}")
    public void deleteProduct(@PathVariable int id) throws DataAccessException{
        productDAO.deleteProduct(id);
    }
}
