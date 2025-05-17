package com.kunfeng2002.dataandhibernate.dao.impl;

import com.kunfeng2002.dataandhibernate.model.Product;
import com.kunfeng2002.dataandhibernate.dao.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.*;
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
    public Product getProductById(int id) throws DataAccessException {
        String sql = "SELECT * FROM product WHERE idProduct = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, productRowMapper);
    }

    @Override
    public void addProduct (List<Product> products){
        String sql = "INSERT INTO product(idProduct, nameProduct, priceProduct) VALUES (?,?,?)";
        jdbcTemplate.batchUpdate(sql, products, products.size(), (ps, product) -> {
            ps.setInt(1, product.getPid());
            ps.setString(2, product.getPname());
            ps.setDouble(3, product.getPprice());
        });
    }

    @Override
    public void updateProduct(List<Product> products) throws DataAccessException{
        String sql = "UPDATE product SET nameProduct = ?, priceProduct = ? WHERE idProduct = ?";
        jdbcTemplate.batchUpdate(sql, products, products.size(), (ps, product) -> {
            ps.setString(1, product.getPname());
            ps.setDouble(2, product.getPprice());
            ps.setInt(3, product.getPid());
        });
    }

    @Override
    public void deleteProduct(int id) throws DataAccessException{
        String sql = "DELETE FROM product WHERE idProduct = ?";
        jdbcTemplate.update(sql, id);
    }
}
