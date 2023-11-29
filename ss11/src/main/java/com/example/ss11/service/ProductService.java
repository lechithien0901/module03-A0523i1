package com.example.ss11.service;

import com.example.ss11.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> listProduct();
    void addProduct(Product product);
    void updateProduct(int id,Product product);
    void deleteProduct(int id);
    Product findById(int id);
}
