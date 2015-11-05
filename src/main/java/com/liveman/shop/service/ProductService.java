package com.liveman.shop.service;

import java.util.List;
import java.util.Map;

import com.liveman.shop.entity.product.Product;

public interface ProductService {

	/***
	 * ��ȡproduct��Ϣ
	 * 
	 * @param id
	 *            product���Ψһ��ʶ��
	 * @return
	 */
	public Product getProductById(int id);

	/***
	 * �������Ͳ�����Ʒ
	 * 
	 * @param categoryId
	 *            ���ͱ��
	 * @return
	 */
	public List<Product> getProductByCategoryId(int categoryId, int start, int records);

	public int getCountByCategoryId(int categoryId);

	/**
	 * ���ݹؼ��ֶ�ȡ��ҳ�Ĳ�Ʒ
	 * 
	 * @param keyword
	 * @param start
	 * @param records
	 * @return
	 */
	public List<Product> getProductByKeyword(String keyword, int start, int records);

	/**
	 * ���ݹؼ���ͳ�Ʋ�Ʒ����
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
