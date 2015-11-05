package com.liveman.shop.entity.order;

public class Favorites {
	private Integer id;

	private Integer userid;

	private Integer productid;

	private String createtime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime == null ? null : createtime.trim();
	}

	@Override
	public String toString() {
		return "Favorites [id=" + id + ", userid=" + userid + ", productid=" + productid + ", createtime=" + createtime
				+ "]";
	}

}