package com.example.ss10.model;

public class Customer {
    private int id;
    private String name;
    private String date;
    private String address;

    public Customer(String name, String date, String address) {
        this.name = name;
        this.date = date;
        this.address = address;
    }

    public Customer(int id, String name, String date, String address) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.address = address;
    }

    public Customer() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
