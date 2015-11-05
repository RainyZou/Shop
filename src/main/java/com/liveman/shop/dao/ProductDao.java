package com.liveman.shop.dao;

import java.util.List;
import java.util.Map;

import com.liveman.shop.entity.product.Product;

public interface ProductDao {

	public Product getProductById(int id);

	public List<Product> getProductByCategoryId(int categoryId, int start, int records);

	public List<Product> getProductByName(String name, int start, int records);

	public int getCountByCategoryId(int categoryId);

	public int getCountByName(String name);

	public List<Product> getSimpleProductByIds(List<Integer> ids);

	public List<Product> getLatestProduct();

	public List<Product> getTopSeller(int count);

	public List<Product> getSuggestionProduct(int count);

	public List<Product> getRelateProduct(int id, int count);

	public int addProduct(Product product);

	public int insertProductCategory(int productId, int categoryId);

	public int insertPictures(int productId, String picturepath);

	public int updateProduct(Product product);

	public int deleteProductCategory(int productId);

	public int deletePictures(int productId);

	public List<Product> getProductByProduct(Map map);

	public int getCountByCondition(Map map);

}
