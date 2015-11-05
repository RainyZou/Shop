package com.liveman.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.liveman.shop.dao.order.PushMapper;
import com.liveman.shop.entity.order.ProductBuyHistoryVO;
import com.liveman.shop.service.PushService;

@Component("pushService")
public class PushServiceImpl implements PushService{

	@Resource
	PushMapper dao;
	
	@Override
	public List<ProductBuyHistoryVO> productBuyHistory(int productId) {
		List<ProductBuyHistoryVO> vos = dao.selectProductBuyHistory(productId);
		return vos;
	}

}
