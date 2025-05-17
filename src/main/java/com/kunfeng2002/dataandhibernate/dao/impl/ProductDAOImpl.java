package com.kunfeng2002.dataandhibernate.dao.impl;

import com.kunfeng2002.dataandhibernate.model.Product;
import com.kunfeng2002.dataandhibernate.dao.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper to map the result set to Product object
    private final RowMapper<Product> productRowMapper = (rs, rowNum) -> {
        Product product = new Product();
        product.setPid(rs.getInt("idProduct"));
        product.setPname(rs.getString("nameProduct"));
        product.setPprice(rs.getDouble("priceProduct"));
        return product;
    };

    @Override
    public List<Product> productList() {
        String sql = "SELECT * FROM product";
        return jdbcTemplate.query(sql, productRowMapper);
    }

    @Override
    public Product getProductById(int id) {
        String sql = "SELECT * FROM product WHERE idProduct = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, productRowMapper);
    }

    @Override
    public void addProduct(Product product) {
        String sql = "INSERT INTO product(`idProduct`, `nameProduct`, `priceProduct`) VALUES (?,?,?)";
        jdbcTemplate.update(sql, product.getPid(), product.getPname(), product.getPprice());
    }

    @Override
    public void updateProduct(Product product) {
        String sql = "UPDATE product SET nameProduct = ?, priceProduct = ? WHERE idProduct = ?";
        jdbcTemplate.update(sql, product.getPname(), product.getPprice(), product.getPid());
    }

    @Override
    public void deleteProduct(int id) {
        String sql = "DELETE FROM product WHERE idProduct = ?";
        jdbcTemplate.update(sql, id);
    }
}
