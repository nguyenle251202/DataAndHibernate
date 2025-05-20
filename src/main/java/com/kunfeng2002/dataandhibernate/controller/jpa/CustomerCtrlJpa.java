package com.kunfeng2002.dataandhibernate.controller.jpa;

import com.kunfeng2002.dataandhibernate.dao.CustomerDAO;
import com.kunfeng2002.dataandhibernate.model.Customer;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/jpa")
public class CustomerCtrlJpa {

    private CustomerDAO customerDAO;

    @GetMapping("/getall")
    public List<Customer> getAllCustomers() {
        List<Customer> customers = customerDAO.getCustomers();
        return customers;
    }
}
