package com.kunfeng2002.dataandhibernate.dao;

import com.kunfeng2002.dataandhibernate.model.Customer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public interface CustomerDAO {
    public List<Customer> getCustomers();

    public Customer getCustomer(int id);

    @Transactional
    public void addCustomer(List<Customer> customers);

    @Transactional
    public void updateCustomer(List<Customer> customers);

    public void deleteCustomer(int id);

    @Transactional
    public List<Customer> getTotal();
}
