package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.user.Address;
import com.liveman.shop.global.ReturnStatus;

public interface AddressService {

	/**
	 * ��ӵ�ַ
	 * 
	 * @param address
	 * @return
	 */
	public ReturnStatus add(Address address);

	/**
	 * �༭��ַ
	 * 
	 * @param address
	 * @return
	 */
	public ReturnStatus edit(Address address);

	/**
	 * ɾ����ַ
	 * 
	 * @param addressId
	 * @return
	 */
	public ReturnStatus delete(int addressId);

	/**
	 * �г����û����µ����е�ַ
	 * 
	 * @param userId
	 * @return
	 */
	public List<Address> list(int userId);

	/**
	 * ��ָ�����ջ��ַ����ΪĬ���ջ��ַ
	 * 
	 * @param addressId
	 * @return
	 */
	public ReturnStatus setAsDefault(int addressId);

	/**
	 * ͨ��addressId��ȡAddress
	 * 
	 * @param addressId
	 * @return
	 */
	public Address get(int addressId);
}
