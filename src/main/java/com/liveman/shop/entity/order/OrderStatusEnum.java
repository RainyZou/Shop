package com.liveman.shop.entity.order;

public enum OrderStatusEnum {
	NOTSHIP("未发货"), SHIP("发货"), SHIPPING("快递运输中"), RECEIVE("已签收"),CANCEL("取消");
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
