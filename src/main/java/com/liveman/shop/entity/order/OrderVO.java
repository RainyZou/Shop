package com.liveman.shop.entity.order;

import com.liveman.shop.entity.user.Address;

public class OrderVO {
	public Address address;
	
	public Order order;

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}
