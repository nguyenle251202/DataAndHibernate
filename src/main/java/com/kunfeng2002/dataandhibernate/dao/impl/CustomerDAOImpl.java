package com.kunfeng2002.dataandhibernate.dao.impl;

import com.kunfeng2002.dataandhibernate.dao.CustomerDAO;
import com.kunfeng2002.dataandhibernate.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Array;
import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<Customer> customerRowMapper = (rs, rowNum) -> {
        Customer customer = new Customer();
        customer.setCid(rs.getInt("idCustomer"));
        customer.setCname(rs.getString("nameCustomer"));
        return customer;
    };

    @Override
    public List<Customer> getCustomers() {
        String sql = "select * from customer";
        return jdbcTemplate.query(sql, customerRowMapper);
    }

//    customer.setCtotal(rs.getDouble("totalpriceCustomer"))
    @Override
    public List<Customer> getTotal() {
        String sql = "select * from customertotalspending";
        return jdbcTemplate.query(sql,
                (rs, rowNum) -> new Customer(
                        rs.getInt("idCustomer"),
                        rs.getString("nameCustomer"),
                        rs.getDouble("totalpriceCustomer")
                ));
    }

    @Override
    public Customer getCustomer(int id) throws DataAccessException {
        String sql = "select * from customer where idCustomer = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, customerRowMapper);
    }

    @Override
    public void addCustomer(List<Customer> customers) throws DataAccessException {
        String sql = "INSERT INTO customer (idCustomer, nameCustomer) VALUES (?,?)";
        jdbcTemplate.batchUpdate(sql, customers, customers.size(), (ps, customer) -> {
            ps.setInt(1, customer.getCid());
            ps.setString(2, customer.getCname());
        });
    }

    @Override
    public void updateCustomer(List<Customer> customers) throws DataAccessException {
        String sql = "UPDATE customer SET nameCustomer = ? WHERE idCustomer = ?";
        jdbcTemplate.batchUpdate(sql, customers, customers.size(), (ps, customer) -> {
            ps.setString(1, customer.getCname());
            ps.setInt(2, customer.getCid());
        });
    }

    @Override
    public void deleteCustomer(int id) throws DataAccessException {
        String sql = "DELETE FROM customer WHERE idCustomer = ?";
        jdbcTemplate.update(sql, id);
    }
}