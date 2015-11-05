package com.liveman.shop.global;

public class ReturnStatus {

	private int code;
	private String message;
	private Object userData;

	ReturnStatus() {
	}

	public ReturnStatus(int code) {
		super();
		this.code = code;
	}

	public ReturnStatus(int code, String message) {
		super();
		this.code = code;
		this.message = message;
	}

	public ReturnStatus(int code, String message, Object userData) {
		super();
		this.code = code;
		this.message = message;
		this.userData = userData;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getUserData() {
		return userData;
	}

	public void setUserData(Object userData) {
		this.userData = userData;
	}

	@Override
	public String toString() {
		return "ReturnStatus [code=" + code + ", message=" + message + ", userData=" + userData + "]";
	}

}
