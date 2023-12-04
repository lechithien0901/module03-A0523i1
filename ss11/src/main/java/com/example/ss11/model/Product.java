package com.example.ss11.model;

public class Product {
    private int id;
    private String nameProduct;
    private double salaryProduct;
    private String productDescription;
    private String producer;

    public Product(int id, String nameProduct, double salaryProduct, String productDescription, String producer) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.salaryProduct = salaryProduct;
        this.productDescription = productDescription;
        this.producer = producer;
    }

    public Product(String nameProduct, double salaryProduct, String productDescription, String producer) {
        this.nameProduct = nameProduct;
        this.salaryProduct = salaryProduct;
        this.productDescription = productDescription;
        this.producer = producer;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getSalaryProduct() {
        return salaryProduct;
    }

    public void setSalaryProduct(double salaryProduct) {
        this.salaryProduct = salaryProduct;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }
}
