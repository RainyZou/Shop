package com.liveman.shop.entity.user;

import com.liveman.shop.entity.product.Product;

public class ProductComment {

	private Product product;

	private Comment comment;

	public ProductComment(Product product, Comment comment) {
		this.product = product;
		this.comment = comment;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}
}
