package com.liveman.shop.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liveman.shop.dao.ProductDao;
import com.liveman.shop.entity.product.Category;
import com.liveman.shop.entity.product.Picture;
import com.liveman.shop.entity.product.Product;
import com.liveman.shop.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;

	@Override
	public Product getProductById(int id) {

		return dao.getProductById(id);
	}

	@Override
	public List<Product> getProductByCategoryId(int categoryId, int start, int records) {
		return dao.getProductByCategoryId(categoryId, start, records);
	}

	@Override
	public int getCountByCategoryId(int categoryId) {
		return dao.getCountByCategoryId(categoryId);
	}

	@Override
	public List<Product> getProductByKeyword(String keyword, int start, int records) {
		return dao.getProductByName(keyword, start, records);
	}

	@Override
	public int getCountByKeyword(String keyword) {
		return dao.getCountByName(keyword);
	}

	@Override
	public Map<Integer, Product> getSimpleProductByIds(List<Integer> ids) {
		Map<Integer, Product> maps = new HashMap<>();
		if (ids.size() == 0) {
			return maps;
		}
		List<Product> list = dao.getSimpleProductByIds(ids);
		for (Product product : list) {
			maps.put(product.getId(), product);
		}
		return maps;
	}

	@Override
	public List<Product> getLatestProduct() {
		return dao.getLatestProduct();
	}

	@Override
	public List<Product> getTopSellerProduct(int count) {
		return dao.getTopSeller(count);
	}

	@Override
	public List<Product> getSuggestProduct(int count) {
		return dao.getSuggestionProduct(count);
	}

	@Override
	public List<Product> getRelateProduct(int id, int count) {

		return dao.getRelateProduct(id, count);
	}

	@Transactional
	@Override
	public boolean addProduct(Product product) {
		dao.addProduct(product);
		for (Category category : product.getCategorys()) {
			dao.insertProductCategory(product.getId(), category.getId());
		}
		for (Picture p : product.getPictures()) {
			dao.insertPictures(product.getId(), p.getPicturePath());
		}
		return true;
	}

	@Transactional
	@Override
	public boolean updateProduct(Product product) {
		boolean flag = dao.updateProduct(product) == 0 ? false : true;
		dao.deleteProductCategory(product.getId());
		dao.deletePictures(product.getId());
		for (Category category : product.getCategorys()) {
			flag &= dao.insertProductCategory(product.getId(), category.getId()) == 0 ? false : true;
		}
		for (Picture p : product.getPictures()) {
			dao.insertPictures(product.getId(), p.getPicturePath());
		}
		return flag;
	}

	@Override
	public List<Product> getProductByProduct(Product product, int start, int pagesize) {
		Map<String, Object> map = new HashMap<>();
		map.put("product", product);
		map.put("start", start);
		map.put("size", pagesize);

		return dao.getProductByProduct(map);
	}

	@Override
	public int getCountByCondition(String name, String type) {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("type", type);

		return dao.getCountByCondition(map);
	}

}
