package com.liveman.shop.entity.order;

/**
 * 
* @Title: Cart.java
* @Package com.liveman.shop.entity.order
* @Description: ���ﳵ
* @author sunny
* @date 2015��10��15��
* @version V1.0
 */
public class Cart {
	//���ﳵ���
	private int id;
	//�û�id
	private int userId;
	//��Ʒid
	private int productId;
	//��Ʒ����
	private int productCount;
	//���ʱ��
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
