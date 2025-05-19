package com.kunfeng2002.dataandhibernate.dao.impl;

import com.kunfeng2002.dataandhibernate.dao.CustomerDAO;
import com.kunfeng2002.dataandhibernate.dao.OrderDAO;
import com.kunfeng2002.dataandhibernate.model.Customer;
import com.kunfeng2002.dataandhibernate.model.Order;
import com.kunfeng2002.dataandhibernate.model.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

import static javax.swing.UIManager.getString;

@Repository
public class OderDAOImpl implements OrderDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Order> MonthlyList() throws DataAccessException {
        String sql = "select * from orderbymonth";
        return jdbcTemplate.query(sql,
                (rs, rowNum) -> new Order (
                        rs.getString("month"),
                        rs.getDouble("totalpriceMonth")
                ));
    }
}
