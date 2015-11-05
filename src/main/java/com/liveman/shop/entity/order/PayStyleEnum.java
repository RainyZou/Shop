package com.liveman.shop.entity.order;

public enum PayStyleEnum {
	WECHAT("微信支付"),ALIPAY("支付宝支付"),BAIDU("百度支付"),BLANK("银联支付");
	private String status;
	
private PayStyleEnum(String status){
	this.status = status;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
