package com.liveman.shop.entity.order;

public enum PayStyleEnum {
	WECHAT("΢��֧��"),ALIPAY("֧����֧��"),BAIDU("�ٶ�֧��"),BLANK("����֧��");
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
