package com.liveman.shop.entity.order;

/**
 * 
* @Title: Cart.java
* @Package com.liveman.shop.entity.order
* @Description: 购物车
* @author sunny
* @date 2015年10月15日
* @version V1.0
 */
public class Cart {
	//购物车编号
	private int id;
	//用户id
	private int userId;
	//产品id
	private int productId;
	//产品数量
	private int productCount;
	//添加时间
    private String createTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", userId=" + userId + ", productId=" + productId + ", productCount=" + productCount
				+ ", createTime=" + createTime + "]";
	}
    
    
    
}
