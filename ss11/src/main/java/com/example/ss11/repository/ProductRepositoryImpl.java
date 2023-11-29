package com.example.ss11.repository;

import com.example.ss11.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository{
    private static Map<Integer,Product> products=new HashMap<>();
    static {
        products.put(1,new Product(1,"Phone",300000,"Vip","Sony"));
        products.put(2,new Product(2,"Laptop",4000000,"Vip","Iphone"));
        products.put(3,new Product(3,"Ipad",5000000,"Vip","Iphone"));
    }
    @Override
    public List<Product> listProduct() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void addProduct(Product product) {
        products.put(product.getId(),product);

    }

    @Override
    public void updateProduct(int id, Product product) {
products.put(id,product);
    }

    @Override
    public void deleteProduct(int id) {
products.remove(id);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }
}
