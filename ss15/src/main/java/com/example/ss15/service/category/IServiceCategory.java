package com.example.ss15.service.category;

import com.example.ss15.model.Category;

import java.util.List;

public interface IServiceCategory {
    List<Category> showListCategory();
    Category findCategoryById(int id);
    void update(Category category);
}
