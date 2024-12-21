package com.DrainApplication.categories.services;

import com.DrainApplication.categories.models.entities.Category;
import com.DrainApplication.categories.models.request.CategoryRequest;
import com.DrainApplication.categories.repository.CategoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {

    public final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    public Category createCategory(CategoryRequest categoryRequest) {
        Category category = new Category();
        category.setCategoryName(categoryRequest.getCategoryName());
        category.setCategoryDescription(categoryRequest.getCategoryDescription());
        return categoryRepository.save(category);
    }

    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }

    public Category editCategory(Long id, CategoryRequest categoryRequest) {
        Optional<Category> category = categoryRepository.findByCategoryId(id);
        if (category.isPresent()) {
            category.get().setCategoryName(categoryRequest.getCategoryName());
            category.get().setCategoryDescription(categoryRequest.getCategoryDescription());
            return categoryRepository.save(category.get());
        }
        return null;
    }

}
