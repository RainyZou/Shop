package com.liveman.shop.entity.order;

import com.liveman.shop.entity.product.Product;

/**
 * 
* @Title: OrderDetail.java
* @Package com.liveman.shop.entity.order
* @Description: 订单详情
* @author sunny
* @date 2015年10月15日
* @version V1.0
 */
public class OrderDetail {
	//主键
	private int id;
	//产品Id
	private Product product;
	//产品数量
	private int productCount;
	//订单id
	private int orderId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	
}
