package com.liveman.shop.entity.order;

import com.liveman.shop.entity.product.Product;

/**
 * 
* @Title: OrderDetail.java
* @Package com.liveman.shop.entity.order
* @Description: ��������
* @author sunny
* @date 2015��10��15��
* @version V1.0
 */
public class OrderDetail {
	//����
	private int id;
	//��ƷId
	private Product product;
	//��Ʒ����
	private int productCount;
	//����id
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
