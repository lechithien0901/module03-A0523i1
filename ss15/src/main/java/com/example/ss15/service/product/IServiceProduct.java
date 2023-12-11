package com.example.ss15.service.product;

import com.example.ss15.model.Product;
//import com.example.ss15.model.ProductDTO;

import java.util.List;

public interface IServiceProduct {
    List<Product> showListDTO();
    void delete(int id);
    void create(Product product);
    Product select(int id);   void update(Product product);
    Product selectProduct(int id);
}
