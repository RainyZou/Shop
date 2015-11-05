package com.liveman.shop.entity.order;

import java.util.List;

import com.liveman.shop.entity.user.Address;

public class PreOrderVO {
	
	public List<Address> addresses;
	
	public List<CartVO> cartVOs;

	public List<CartVO> getCartVOs() {
		return cartVOs;
	}

	public void setCartVOs(List<CartVO> cartVOs) {
		this.cartVOs = cartVOs;
	}

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

}
