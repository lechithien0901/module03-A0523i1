package com.example.ss15.service.product;

import com.example.ss15.model.Product;
import com.example.ss15.repository.IProductRepository;
import com.example.ss15.repository.ProductRepository;

import java.util.List;

public class ServiceProduct implements IServiceProduct{
    IProductRepository iProductRepository=new ProductRepository();
    @Override
    public List<Product> showListDTO() {
        return iProductRepository.showListDTO();
    }

    @Override
    public void delete(int id) {
iProductRepository.delete(id);
    }

    @Override
    public void create(Product product) {iProductRepository.create(product);

    }

    @Override
    public Product select(int id) {
        return iProductRepository.select(id);
    }

    @Override
    public void update(Product product) {
        iProductRepository.update(product);
    }

    @Override
    public Product selectProduct(int id) {
        return iProductRepository.selectProduct(id);
    }
}
