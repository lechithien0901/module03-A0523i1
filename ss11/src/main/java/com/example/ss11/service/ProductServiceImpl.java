package com.example.ss11.service;

import com.example.ss11.model.Product;
import com.example.ss11.repository.ProductRepository;
import com.example.ss11.repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements ProductService{
    ProductRepository productRepository=new ProductRepositoryImpl();
    @Override
    public List<Product> listProduct() {
        return productRepository.listProduct();
    }

    @Override
    public void addProduct(Product product) {
productRepository.addProduct(product);
    }

    @Override
    public void updateProduct(int id, Product product) {
productRepository.updateProduct(id,product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);

    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }
}
