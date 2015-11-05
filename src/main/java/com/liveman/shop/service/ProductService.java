package com.liveman.shop.service;

import java.util.List;
import java.util.Map;

import com.liveman.shop.entity.product.Product;

public interface ProductService {

	/***
	 * 获取product信息
	 * 
	 * @param id
	 *            product表的唯一标识符
	 * @return
	 */
	public Product getProductById(int id);

	/***
	 * 根据类型查找商品
	 * 
	 * @param categoryId
	 *            类型编号
	 * @return
	 */
	public List<Product> getProductByCategoryId(int categoryId, int start, int records);

	public int getCountByCategoryId(int categoryId);

	/**
	 * 根据关键字读取分页的产品
	 * 
	 * @param keyword
	 * @param start
	 * @param records
	 * @return
	 */
	public List<Product> getProductByKeyword(String keyword, int start, int records);

	/**
	 * 根据关键字统计产品数量
	 * 
	 * @param keyword
	 * @return
	 */
	public int getCountByKeyword(String keyword);

	public Map<Integer, Product> getSimpleProductByIds(List<Integer> ids);

	public List<Product> getLatestProduct();

	public List<Product> getTopSellerProduct(int count);

	public List<Product> getSuggestProduct(int count);

	public List<Product> getRelateProduct(int id, int count);

	public boolean addProduct(Product product);

	public boolean updateProduct(Product product);

	public List<Product> getProductByProduct(Product product, int start, int pagesize);

	public int getCountByCondition(String name, String type);

}
