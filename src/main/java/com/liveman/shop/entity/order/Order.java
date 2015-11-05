package com.liveman.shop.entity.order;

import java.util.List;

/**
 * 
* @Title: Order.java
* @Package com.liveman.shop.entity.order
* @Description: ����
* @author sunny
* @date 2015��10��15��
* @version V1.0
 */
/**
 * 
* @Title: Order.java
* @Package com.liveman.shop.entity.order
* @Description: ����
* @author sunny
* @date 2015��10��20��
* @version V1.0
 */
public class Order {
	//����
	private int id;
	//�������
	private String orderId;
	//�û�id
	private int userId;
	//����ʱ��
	private String createTime;
	//����״̬(δ��������������������У���ǩ��)
	private String orderStatus;
	//֧��״̬
	private String payStatus;
	//ȷ���ջ�(1��ʾ�ջ���0��ʾδ�ջ�)
	private int receiveStatus;
	//֧����ʽ
	private String payStyle;
	//�����۸�
	private double orderPrice;
	//�������
	private double shipPrice;
	//�ܷ���
	private double allPrice;
	//����ʱ��
	private String deliverTime;
	//�������
	private String shipName;
	//�˵�����
	private String shipOrderNumber;
	//����ʱ��
	private String payTime;
	//�ջ���ַ
	private int addressId;
	//����
	private String comment;
	//����Id
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
