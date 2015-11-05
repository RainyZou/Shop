package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.order.OrderVO;

public interface OrderService {
	public void addOrder(Integer addressId, String comment, int userId, Integer[] productIds);

	public List<OrderVO> managerOrder(int userId, String searchType);

	public void cancelOrder(int orderId);
	
	public void restoreOrder(int orderId);
	
	public OrderVO get(int id);
}
