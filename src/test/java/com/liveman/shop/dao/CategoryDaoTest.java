package com.liveman.shop.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.entity.product.Category;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class CategoryDaoTest {

	@Autowired
	CategoryDao dao;

	@Test
	public void testGetCategoryById() {
		Category c = dao.getCategoryById(1);
		System.out.println(c);
	}

	@Test
	public void testSelectCategoryByProductId() {
		List<Category> c = dao.selectCategoryByProductId(1);
		System.out.println(c);
	}

	@Test
	public void getCategoryTree() {
		Category c = dao.getCategoryTree(1);
		Assert.assertNotNull(c);
	}

	@Test
	public void addCategoryTest() {
		Category c = new Category();
		c.setCname("ÊÖ»ú");
		c.setParent(dao.getSingleCategory(1));
		dao.addCategory(c);

	}

}
