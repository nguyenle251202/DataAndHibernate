package com.kunfeng2002.dataandhibernate.dao;

import com.kunfeng2002.dataandhibernate.model.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderDAO {

    List<Order> MonthlyList();
}
