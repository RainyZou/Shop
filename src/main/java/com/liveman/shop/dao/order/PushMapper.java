package com.liveman.shop.dao.order;

import java.util.List;

import com.liveman.shop.entity.order.ProductBuyHistoryVO;

public interface PushMapper {
	public List<ProductBuyHistoryVO> selectProductBuyHistory(int productId);
}
