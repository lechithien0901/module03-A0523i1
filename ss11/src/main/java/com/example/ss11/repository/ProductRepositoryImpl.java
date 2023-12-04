package com.example.ss11.repository;

import com.example.ss11.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository{
    private final String FIND_ALL = "SELECT * FROM product";
    private final String ADD_NEW_STUDENT = "insert into product(nameProduct,salaryProduct,productDescription,producer)\n" +
            "values(?,?,?,?)";
   private final String SELECT_PRODUCT_BY_ID="select id,nameProduct,salaryProduct, productDescription, producer from product where id=?;";
    private static Map<Integer,Product> products=new HashMap<>();

    @Override
    public List<Product> listProduct() {
        List<Product>list=new ArrayList<>();

        try {
           Connection connection=BaseRepository.getConnection();
           Statement statement=connection.createStatement();
           ResultSet resultSet=statement.executeQuery(FIND_ALL);
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("nameProduct");
            double salary=resultSet.getDouble("salaryProduct");
            String productDescription=resultSet.getString("productDescription");
            String producer=resultSet.getString("producer");
            list.add(new Product(id,name,salary,productDescription,producer));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public void addProduct(Product product) {
Connection connection=BaseRepository.getConnection();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(ADD_NEW_STUDENT);
            preparedStatement.setString(1,product.getNameProduct());
            preparedStatement.setDouble(2,product.getSalaryProduct());
            preparedStatement.setString(3,product.getProductDescription());
            preparedStatement.setString(4,product.getProducer());

            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }

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
