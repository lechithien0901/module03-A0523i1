package com.example.ss15.service.category;

import com.example.ss15.model.Category;
import com.example.ss15.repository.CategoryRepository;
import com.example.ss15.repository.ICategoryRepository;

import java.util.List;

public class ServiceCategory implements IServiceCategory{
    ICategoryRepository iCategoryRepository=new CategoryRepository();
    @Override
    public List<Category> showListCategory() {
        return iCategoryRepository.showListCategory();
    }

    @Override
    public Category findCategoryById(int id) {
        return iCategoryRepository.findCategoryById(id);
    }

    @Override
    public void update(Category category) {
        iCategoryRepository.update(category);
    }
}
