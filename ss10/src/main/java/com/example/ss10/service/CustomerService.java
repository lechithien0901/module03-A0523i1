package com.example.ss10.service;

import com.example.ss10.model.Customer;
import com.example.ss10.repository.CustomerRepository;
import com.example.ss10.repository.ICustomerRepository;

import java.util.ArrayList;

public class CustomerService implements ICustomerService{
    ICustomerRepository iCustomerRepository=new CustomerRepository();
    @Override
    public ArrayList<Customer> list() {
        return iCustomerRepository.list();
    }
}
