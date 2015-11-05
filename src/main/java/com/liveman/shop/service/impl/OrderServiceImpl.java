package com.liveman.shop.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.liveman.shop.dao.order.OrderMapper;
import com.liveman.shop.entity.order.CartVO;
import com.liveman.shop.entity.order.Order;
import com.liveman.shop.entity.order.OrderDetail;
import com.liveman.shop.entity.order.OrderStatusEnum;
import com.liveman.shop.entity.order.OrderVO;
import com.liveman.shop.global.DateTool;
import com.liveman.shop.service.CartService;
import com.liveman.shop.service.OrderService;

@Component("orderService")
public class OrderServiceImpl implements OrderService {

	private final String ORDERPRESTR = "THX";
	@Resource
	CartService cartService;
	@Resource
	OrderMapper orderMapper;

	@Override
	public void addOrder(Integer addressId, String comment, int userId, Integer[] productIds) {
		Order order = new Order();
		order.setOrderId(ORDERPRESTR + System.currentTimeMillis());
		order.setUserId(userId);
		order.setCreateTime(DateTool.getCurrentTimeCN());
		order.setOrderStatus(OrderStatusEnum.NOTSHIP.getStatus());
		order.setPayStatus("未支付");
		List<CartVO> vos = cartService.findCartsByProductIds(userId, Arrays.asList(productIds));
		double all = 0;
		for (CartVO cartVO : vos) {
			int count = cartVO.getCart().getProductCount();
			double temp = cartVO.getProduct().getCurrentPrice() * count;
			all += temp;
		}
		order.setOrderPrice(all);
		order.setShipPrice(0);
		order.setAllPrice(all + 0);
		order.setAddressId(addressId);
		order.setComment(comment);
		orderMapper.insertOrder(order);

		List<OrderDetail> details = new ArrayList<>();
		for (CartVO cartVO : vos) {
			OrderDetail detail = new OrderDetail();
			detail.setOrderId(order.getId());
			detail.setProductCount(cartVO.getCart().getProductCount());
			detail.setProduct(cartVO.getProduct());
			details.add(detail);
		}
		orderMapper.insertOrderDetail(details);
	}

	@Override
	public List<OrderVO> managerOrder(int userId, String searchType) {
		List<OrderVO> orders = null;
		if ("ALL".equals(searchType)) {
			orders = orderMapper.selectAllOrders(userId);
		} else if ("PAY".equals(searchType)) {
			orders = orderMapper.selectOrdersByPayStatus(userId, "未支付");
		} else if ("SHIP".equals(searchType)) {
			orders = orderMapper.selectOrdersByOrderStatus(userId, "未发货");
		} else if ("CANCEL".equals(searchType)) {
			orders = orderMapper.selectOrdersByCancelStatus(userId);
		} else if ("RECEIVE".equals(searchType)) {
			orders = orderMapper.selectOrdersByReceiveStatus(userId, 0);
		} else if ("EVALUACTION".equals(searchType)) {
			orders = orderMapper.selectOrdersByEvaluation(userId);
		}
		return orders;
	}

	@Override
	public void cancelOrder(int orderId) {
		OrderVO orderVO = orderMapper.selectOrderById(orderId);
		if (orderVO != null && orderVO.getOrder() != null && orderVO.getOrder().getPayStatus().equals("未支付")) {
			orderMapper.updateOrderStatus(orderId, OrderStatusEnum.CANCEL.getStatus());
		}
	}
	
	@Override
	public void restoreOrder(int orderId) {
		OrderVO orderVO = orderMapper.selectOrderById(orderId);
		if (orderVO != null && orderVO.getOrder() != null && orderVO.getOrder().getPayStatus().equals("未支付")) {
			orderMapper.updateOrderStatus(orderId, OrderStatusEnum.NOTSHIP.getStatus());
		}
	}

	@Override
	public OrderVO get(int id) {
		return orderMapper.selectOrderById(id);
	}

	

}
