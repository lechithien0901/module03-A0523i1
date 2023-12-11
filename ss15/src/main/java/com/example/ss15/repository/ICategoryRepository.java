package com.example.ss15.repository;

import com.example.ss15.model.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> showListCategory();
    Category findCategoryById(int id);
    void update(Category category);

}
