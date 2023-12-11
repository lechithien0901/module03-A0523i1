package com.example.ss15.repository;

import com.example.ss15.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository{
    private static final String showSelectAll="select id,name from  category;";
    private static final String FIND="select * from category\n" +
            "where id=?;";
    private static final String Update="update  category set\n" +
            "name=?\n" +
            "where id=?;";
    @Override
    public List<Category> showListCategory() {
        Connection connection=BaseRepository.getConnection();
        List<Category>list=new ArrayList<>();
        try {
         PreparedStatement   preparedStatement = connection.prepareStatement(showSelectAll);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                list.add(new Category(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;
    }

    @Override
    public Category findCategoryById(int id) {
        Connection connection=BaseRepository.getConnection();
        Category category=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(FIND);
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("name");
                category=new Category(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return category;
    }

    @Override
    public void update(Category category) {
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(Update);
            preparedStatement.setString(1,category.getName());
            preparedStatement.setInt(2,category.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
