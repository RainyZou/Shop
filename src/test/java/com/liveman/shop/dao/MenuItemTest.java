package com.liveman.shop.dao;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.dao.MenuTableDao;
import com.liveman.shop.entity.MenuItem;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class MenuItemTest {

	@Autowired
	MenuTableDao dao;

	@Test
	public void testGetMenuItemById() {
		MenuItem item = dao.getMenuById(0);

		Assert.assertEquals(item, null);
	}

	@Test
	public void testGetChildrenById() {
		List<MenuItem> items = dao.getChildrenMenuById(0);
		Assert.assertEquals(0, items.size());
	}

	@Test
	public void testGetChildrenMenuFromRoot() {
		List<MenuItem> items = dao.getChildrenMenuFromRoot();
		Assert.assertEquals(1, items.size());
	}

}
