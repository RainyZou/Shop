package com.liveman.shop.dao;

import java.util.List;

import com.liveman.shop.entity.product.Category;

public interface CategoryDao {

	/***
	 * 
	 * @param id
	 *            Category id
	 * @return
	 */
	public Category getCategoryById(int id);

	/***
	 * 
	 * @param id
	 *            ±íÊ¾Îª product id
	 * @return
	 */
	public List<Category> selectCategoryByProductId(int id);

	public Category getCategoryTree(int id);
	
	public int addCategory(Category category);
	
	public Category getSingleCategory(int id);


}
