package com.liveman.shop.entity.order;

import java.util.List;

/**
 * 
* @Title: Order.java
* @Package com.liveman.shop.entity.order
* @Description: 订单
* @author sunny
* @date 2015年10月15日
* @version V1.0
 */
/**
 * 
* @Title: Order.java
* @Package com.liveman.shop.entity.order
* @Description: 订单
* @author sunny
* @date 2015年10月20日
* @version V1.0
 */
public class Order {
	//主键
	private int id;
	//订单编号
	private String orderId;
	//用户id
	private int userId;
	//创建时间
	private String createTime;
	//订单状态(未发货，发货，快递运输中，已签收)
	private String orderStatus;
	//支付状态
	private String payStatus;
	//确认收货(1表示收货，0表示未收货)
	private int receiveStatus;
	//支付方式
	private String payStyle;
	//订单价格
	private double orderPrice;
	//运输费用
	private double shipPrice;
	//总费用
	private double allPrice;
	//发货时间
	private String deliverTime;
	//快递名称
	private String shipName;
	//运单号码
	private String shipOrderNumber;
	//付款时间
	private String payTime;
	//收货地址
	private int addressId;
	//留言
	private String comment;
	//评价Id
	private int evaluationId;
	
	private List<OrderDetail> details;
	public List<OrderDetail> getDetails() {
		return details;
	}
	public void setDetails(List<OrderDetail> details) {
		this.details = details;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	
	public int getReceiveStatus() {
		return receiveStatus;
	}
	public void setReceiveStatus(int receiveStatus) {
		this.receiveStatus = receiveStatus;
	}
	public String getPayStyle() {
		return payStyle;
	}
	public void setPayStyle(String payStyle) {
		this.payStyle = payStyle;
	}
	public double getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}
	public double getShipPrice() {
		return shipPrice;
	}
	public void setShipPrice(double shipPrice) {
		this.shipPrice = shipPrice;
	}
	public double getAllPrice() {
		return allPrice;
	}
	public void setAllPrice(double allPrice) {
		this.allPrice = allPrice;
	}
	public String getDeliverTime() {
		return deliverTime;
	}
	public void setDeliverTime(String deliverTime) {
		this.deliverTime = deliverTime;
	}
	public String getShipName() {
		return shipName;
	}
	public void setShipName(String shipName) {
		this.shipName = shipName;
	}
	public String getShipOrderNumber() {
		return shipOrderNumber;
	}
	public void setShipOrderNumber(String shipOrderNumber) {
		this.shipOrderNumber = shipOrderNumber;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getEvaluationId() {
		return evaluationId;
	}
	public void setEvaluationId(int evaluationId) {
		this.evaluationId = evaluationId;
	}
	
	
}
