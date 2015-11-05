package com.liveman.shop.entity.order;

import com.liveman.shop.entity.product.Product;

public class CartVO {
	private Cart cart;
	private Product product;
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
}
