package com.kunfeng2002.dataandhibernate.controller;

import com.kunfeng2002.dataandhibernate.dao.CustomerDAO;
import com.kunfeng2002.dataandhibernate.dao.OrderDAO;
import com.kunfeng2002.dataandhibernate.dao.ProductDAO;
import com.kunfeng2002.dataandhibernate.model.Customer;
import com.kunfeng2002.dataandhibernate.model.Order;
import com.kunfeng2002.dataandhibernate.model.Product;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/result")
public class ResultCtrl {

    private final ProductDAO productDAO;
    private final OrderDAO orderDAO;
    private final CustomerDAO customerDAO;

    public ResultCtrl(ProductDAO productDAO, OrderDAO orderDAO, CustomerDAO customerDAO) throws DataAccessException {
        this.productDAO = productDAO;
        this.orderDAO = orderDAO;
        this.customerDAO = customerDAO;
    }

    @GetMapping("/FiveHighestRevenue")
    public List<Product> FiveHighestRevenue(HttpServletRequest request) {
        List<Product> hightestList = productDAO.HightestList();
        return hightestList;
    }

    @GetMapping("/TotalRevenueCustomer")
    public List<Customer> TotalRevenueCustomer(HttpServletRequest request) {
        List<Customer> totalRevenueCustomer = customerDAO.getTotal();
        return totalRevenueCustomer;
    }

    @GetMapping("/CategorizeOrders/monthly")
    public List<Order> ListMonthly() {
        List<Order> monthlyList = orderDAO.MonthlyList();
        return monthlyList;
    }
}
