package com.liveman.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.liveman.shop.dao.CategoryDao;
import com.liveman.shop.entity.product.Category;
import com.liveman.shop.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Resource
	CategoryDao dao;

	@Override
	public Category getCategoryById(int id) {

		return dao.getCategoryById(id);
	}

	@Override
	public List<Category> getRootCategoryList() {

		return getCategoryById(1).getChildren();
	}

	@Override
	public List<Category> getCateagoryByProductId(int id) {

		return dao.selectCategoryByProductId(id);
	}

	@Override
	public Category getRootCategory() {

		return dao.getCategoryTree(1);
	}

	@Override
	public Category getSingleCategory(int id) {

		return dao.getSingleCategory(id);
	}

	@Override
	public int addCategory(Category category) {

		return dao.addCategory(category);
	}

}
