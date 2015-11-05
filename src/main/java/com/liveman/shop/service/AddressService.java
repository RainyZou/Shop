package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.user.Address;
import com.liveman.shop.global.ReturnStatus;

public interface AddressService {

	/**
	 * 添加地址
	 * 
	 * @param address
	 * @return
	 */
	public ReturnStatus add(Address address);

	/**
	 * 编辑地址
	 * 
	 * @param address
	 * @return
	 */
	public ReturnStatus edit(Address address);

	/**
	 * 删除地址
	 * 
	 * @param addressId
	 * @return
	 */
	public ReturnStatus delete(int addressId);

	/**
	 * 列出该用户名下的所有地址
	 * 
	 * @param userId
	 * @return
	 */
	public List<Address> list(int userId);

	/**
	 * 将指定的收获地址设置为默认收获地址
	 * 
	 * @param addressId
	 * @return
	 */
	public ReturnStatus setAsDefault(int addressId);

	/**
	 * 通过addressId获取Address
	 * 
	 * @param addressId
	 * @return
	 */
	public Address get(int addressId);
}
