package com.liveman.shop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liveman.shop.dao.CategoryDao;
import com.liveman.shop.dao.MenuTableDao;
import com.liveman.shop.dao.ProductDao;
import com.liveman.shop.entity.MenuItem;
import com.liveman.shop.entity.Node;
import com.liveman.shop.service.NodeService;

@Service
public class NodeServiceImpl implements NodeService {

	@Autowired
	MenuTableDao menuTableDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	CategoryDao categoryDao;

	Node menuNode;

	boolean flag = false;

	@Override
	public Node getRootTreeNodes() {
		if (menuNode == null || flag) {
			MenuItem item = menuTableDao.getMenuById(1);
			menuNode = translate(item);
			setNodeChildren(menuNode);
			flag = false;
		}

		return menuNode;
	}

	public List<Node> getNodeRootList() {
		List<MenuItem> items = menuTableDao.getAllItemFromRoot();
		List<Node> nodes = new ArrayList<>();
		for (MenuItem menuItem : items) {
			int level = findLevelFromList(menuItem.getParentId(), items);
			Node node = new Node();
			node.setId(menuItem.getId());
			node.setLevel(level);
			node.setUrl(menuItem.getUrl());
			node.setType(menuItem.getType());
			node.setName(menuItem.getName());
			nodes.add(node);
		}
		return nodes;
	}

	private int findLevelFromList(int id, List<MenuItem> items) {
		int level = 1;
		for (MenuItem menuItem : items) {
			if (id == menuItem.getId()) {
				int curId = menuItem.getParentId();
				if (curId != 1) {
					level += findLevelFromList(curId, items);
				} else {
					level++;
				}
			}
		}
		return level;
	}

	private void setNodeChildren(Node node) {
		int id = node.getId();
		List<MenuItem> items = menuTableDao.getChildrenMenuById(id);
		List<Node> children = new ArrayList<>();
		for (MenuItem item : items) {
			Node varNode = translate(item);
			setNodeChildren(varNode);
			children.add(varNode);
		}
		node.setChildren(children);
	}

	private Node translate(MenuItem item) {
		Node node = new Node();
		node.setId(item.getId());
		node.setPicture(item.getPicture());
		node.setUrl(item.getUrl());
		node.setType(item.getType());

		node.setName(item.getName());

		return node;
	}

	@Override
	public boolean saveMenu(List<Integer> level, List<MenuItem> menus) {

		menuTableDao.deleteAllOthers();

		for (int i = 0; i < menus.size(); i++) {
			MenuItem m = menus.get(i);
			int l = level.get(i);
			if (l == 1) {
				m.setParentId(1);
			} else {
				for (int j = i; j >= 0; j--) {
					if (level.get(j) == l - 1) {
						m.setParentId(menus.get(j).getId());
						break;
					}
				}
			}
			menuTableDao.saveMenuItem(m);
		}
		flag = true;
		return true;
	}

}
