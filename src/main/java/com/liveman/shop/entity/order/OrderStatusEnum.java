package com.liveman.shop.entity.order;

public enum OrderStatusEnum {
	NOTSHIP("δ����"), SHIP("����"), SHIPPING("���������"), RECEIVE("��ǩ��"),CANCEL("ȡ��");
	private String status;

	private OrderStatusEnum(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
