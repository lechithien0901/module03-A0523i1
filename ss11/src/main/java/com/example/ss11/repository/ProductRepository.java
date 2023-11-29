package com.example.ss11.repository;

import com.example.ss11.model.Product;

import java.util.List;

public interface ProductRepository{
    List<Product> listProduct();
    void addProduct(Product product);
    void updateProduct(int id,Product product);
    void deleteProduct(int id);
    Product findById(int id);
}
