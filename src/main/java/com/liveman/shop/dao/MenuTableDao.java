package com.liveman.shop.dao;

import java.util.List;

import com.liveman.shop.entity.MenuItem;

public interface MenuTableDao {

	public MenuItem getMenuById(int id);

	public List<MenuItem> getChildrenMenuById(int id);

	public List<MenuItem> getChildrenMenuFromRoot();

	public List<MenuItem> getAllItemFromRoot();
	
	public int saveMenuItem(MenuItem item);
	
	public int deleteAllOthers();

}
