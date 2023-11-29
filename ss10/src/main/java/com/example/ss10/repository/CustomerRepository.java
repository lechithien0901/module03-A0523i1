package com.example.ss10.repository;

import com.example.ss10.model.Customer;

import java.util.ArrayList;

public class CustomerRepository implements ICustomerRepository{
   static ArrayList<Customer>arrayList=new ArrayList<>();
    static {
        arrayList.add(new Customer(1,"Mai Văn Hoàn","1983-08-20","Hà Nội"));
        arrayList.add(new Customer(2,"Nguyễn Văn Nam","1983-08-21","Bắc Giang"));
        arrayList.add(new Customer(3,"Nguyễn Thái Hòa","1983-08-22","Nam Định"));
        arrayList.add(new Customer(4,"Trần Đăng Khoa","1983-08-17","Hà Tây"));
        arrayList.add(new Customer(5,"Nguyễn Định Thi","1983-08-19","Hà Nội"));
    }
    @Override
    public ArrayList<Customer> list() {
        return arrayList;
    }
}
