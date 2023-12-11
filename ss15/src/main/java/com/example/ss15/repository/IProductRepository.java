package com.example.ss15.repository;

import com.example.ss15.model.Product;
//import com.example.ss15.model.ProductDTO;

import java.util.List;

public interface IProductRepository {
    Product select(int id);
    List<Product> showListDTO();
    void delete(int id);
    void create(Product product);
    void update(Product product);
    Product selectProduct(int id);

}
