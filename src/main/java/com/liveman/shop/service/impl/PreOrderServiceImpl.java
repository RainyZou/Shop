package com.liveman.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.liveman.shop.entity.order.CartVO;
import com.liveman.shop.entity.order.PreOrderVO;
import com.liveman.shop.entity.user.Address;
import com.liveman.shop.service.AddressService;
import com.liveman.shop.service.CartService;
import com.liveman.shop.service.PreOrderService;

@Component("preOrderService")
public class PreOrderServiceImpl implements PreOrderService {
	
	@Resource
	public AddressService addressService;
	@Resource
	public CartService cartServcie;

	@Override
	public PreOrderVO getPreOrder(int userId) {
		// TODO Auto-generated method stub
		List<Address> addresses = addressService.list(userId);
		List<CartVO> cartVOs = cartServcie.findCartsByUserId(userId);
		PreOrderVO vos = new PreOrderVO();
		vos.setAddresses(addresses);
		vos.setCartVOs(cartVOs);
		return vos;
	}
}
