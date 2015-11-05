package com.liveman.shop.express;

import java.util.List;

/**
 * 
* @Title: Express.java
* @Package com.liveman.shop.express
* @Description: 快递信息
* @author sunny
* @date 2015年11月3日
* @version V1.0
 */
public class Express {
	private String id;
	private String name;
	private String order;
	private String message;
	private String errcode;
	private int status;
	private List<ExpressData> data;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getErrcode() {
		return errcode;
	}
	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<ExpressData> getData() {
		return data;
	}
	public void setData(List<ExpressData> data) {
		this.data = data;
	}
	
	
}
