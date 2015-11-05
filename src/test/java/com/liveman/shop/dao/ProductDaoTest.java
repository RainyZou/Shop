package com.liveman.shop.dao;

import static org.hamcrest.Matchers.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.taglibs.standard.lang.jstl.GreaterThanOperator;
import org.hamcrest.BaseMatcher;
import org.hamcrest.core.AllOf;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.entity.product.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class ProductDaoTest {

	@Autowired
	public ProductDao dao;

	@Test
	public void testgetProduct() {
		Product p = dao.getProductById(1);
		System.out.println(p);
	}

	@Test
	public void testgetProductByCategoryId() {
		List<Product> pList = dao.getProductByCategoryId(14, 0, 5);
		for (Product p : pList) {
			System.out.println(p.getName());
		}
	}

	@Test
	public void testGetProductByName() {
		List<Product> pList = dao.getProductByName("iphone", 0, 5);
		for (Product product : pList) {
			System.out.println(product.getName());
		}
	}

	@Test
	public void testCountByCategoryId() {
		int count = dao.getCountByCategoryId(14);
		System.out.println(count);
	}

	@Test
	public void getProductByProductTest() {
		Product p = new Product();
		p.setName("Внгу");
		p.setType("product");
		Map<String, Object> map = new HashMap<>();
		map.put("product", p);
		map.put("start", 0);
		map.put("size", 6);
		List<Product> pList = dao.getProductByProduct(map);

		Assert.assertThat(pList.size(), greaterThan(0));
	}
	
	@Test
	public void getCountByConditionTest(){
		Map<String,String> map = new HashMap<>();
		map.put("name", "Внгу");
		map.put("type", "product");
		
		int count = dao.getCountByCondition(map);
		
		Assert.assertThat(count, greaterThan(0));
	}
}
