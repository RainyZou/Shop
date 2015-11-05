package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.MenuItem;
import com.liveman.shop.entity.Node;

public interface NodeService {

	public Node getRootTreeNodes();

	public List<Node> getNodeRootList();

	public boolean saveMenu(List<Integer> level, List<MenuItem> menus);
}
