package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.product.Category;

public interface CategoryService {

	public Category getCategoryById(int id);

	public List<Category> getCateagoryByProductId(int id);

	public Category getRootCategory();
	
	public Category getSingleCategory(int id);
	
	public int addCategory(Category category);
	
	public List<Category> getRootCategoryList();
}
