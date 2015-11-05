package com.liveman.shop.entity.user;

public class Comment {
	private Integer id;

	private Integer userId;

	private Integer productId;

	private Integer orderId;

	private Integer stars;

	private String commentText;

	private String createTime;

	private Integer commentId;

	private String userName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getStars() {
		return stars;
	}

	public void setStars(Integer stars) {
		this.stars = stars;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText == null ? null : commentText.trim();
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime == null ? null : createTime.trim();
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", userId=" + userId + ", productId=" + productId + ", orderId=" + orderId
				+ ", stars=" + stars + ", commentText=" + commentText + ", createTime=" + createTime + ", commentId="
				+ commentId + ", userName=" + userName + "]";
	}

}