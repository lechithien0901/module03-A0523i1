package com.example.ss15.repository;

import com.example.ss15.model.Category;
import com.example.ss15.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT_ALL = "select * from product p join \n" +
            "category c on c.id=p.category_id;";
    private static final String SELECT_PRODUCTDTO = "select * from product p join category c on c.id=p.category_id\n" +
            "where p.id=?;";
    private static final String DELETE = "delete from product where id=?;";
    private static final String CREATE = "insert into product(name,category_id)\n" +
            "values(?,?);";
    private static  final String UPDATE="update product set `name` = ?, category_id = ? where id = ?";
    private static final String SELECT_PRODUCT="select id,name from product\n" +
            "where id=?;";

    @Override
    public Product select(int id) {
        Connection connection = BaseRepository.getConnection();
        Product productDTO = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTDTO);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String categoryName = resultSet.getString(5);
                Category cate = new Category(resultSet.getInt(4), categoryName);
                productDTO = new Product(id, name, cate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productDTO;
    }

    @Override
    public Product selectProduct(int id) {
        Product product=null;
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_PRODUCT);
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("name");
                product=new Product(id,name);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> showListDTO() {
        List<Product> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String categoryName = resultSet.getString(5);
                Category cate = new Category(resultSet.getInt(4), categoryName);
                Product productDTO = new Product(id, name, cate);
                list.add(productDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void create(Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getCategory().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void update(Product product) {
        try (
                Connection connection=BaseRepository.getConnection();
                PreparedStatement preparedStatement=connection.prepareStatement(UPDATE);
                ){
            System.out.println("-------");
            System.out.println(product);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setInt(2,product.getCategory().getId());
            preparedStatement.setInt(3, product.getId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
