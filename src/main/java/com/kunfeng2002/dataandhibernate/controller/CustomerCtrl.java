package com.kunfeng2002.dataandhibernate.controller;

import com.kunfeng2002.dataandhibernate.dao.CustomerDAO;
import com.kunfeng2002.dataandhibernate.model.Customer;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customer")
public class CustomerCtrl {

    private final CustomerDAO customerDAO;

    public CustomerCtrl(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    @GetMapping("/getall")
    public List<Customer> getAll() {
        List<Customer> customers = customerDAO.getCustomers();
        return customers;
    }

    @GetMapping("/get/{id}")
    public Customer getById(@PathVariable int id) {
        Customer customer = customerDAO.getCustomer(id);
        return customer;
    }

    @PostMapping("/add")
    public ResponseEntity<Customer> addCustomer(@RequestBody List<Customer> customer) {
        customerDAO.addCustomer(customer);
        return null;
    }

    @PostMapping("/update")
    public ResponseEntity<Customer> updateCustomer(@RequestBody List<Customer> customer) {
        customerDAO.updateCustomer(customer);
        return null;
    }

    @PostMapping("/delete/{id}")
    public void deleteCustomer(@PathVariable int id) {
        customerDAO.deleteCustomer(id);
    }
}
