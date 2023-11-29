package com.example.mvc.service;

import com.example.mvc.model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    void remove(int id);
    void save(Customer customer);
    Customer findById(int id);
    void update(int id,Customer customer);

}
