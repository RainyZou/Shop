package com.liveman.shop.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.entity.product.Category;
import com.liveman.shop.entity.product.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class ProductServiceTest {

	@Resource
	ProductService service;

	@Resource
	CategoryService categoryService;

	@Test
	public void TestAddProduct() {

		Product product = new Product();
		product.setName("КЃгу");
		product.setShortDescription("test2323");
		product.setDetails("2312314214");

		service.addProduct(product);

	}

	@Test
	public void TestAddProductCategory() {
		Product product = new Product();
		product.setName("КЃгу");
		product.setShortDescription("test2323");
		product.setDetails("2312314214");

		List<Category> cList = categoryService.getCategoryById(1).getChildren();

		List<Category> pList = new ArrayList<>();
		pList.add(cList.get(5));

		product.setCategorys(pList);

		service.addProduct(product);

	}

}
