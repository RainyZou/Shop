package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.order.ProductBuyHistoryVO;

public interface PushService {
	public List<ProductBuyHistoryVO> productBuyHistory(int productId);
}
