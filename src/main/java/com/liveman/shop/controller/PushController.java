package com.liveman.shop.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liveman.shop.entity.order.ProductBuyHistoryVO;
import com.liveman.shop.service.PushService;

@Controller
@RequestMapping("/push")
public class PushController {
	
	@Resource
	PushService pushService;
	
	@RequestMapping("/buyHistory")
	public @ResponseBody List<ProductBuyHistoryVO> productBuyHistory(int productId){
		List<ProductBuyHistoryVO> vos = pushService.productBuyHistory(productId);
		return vos;
	}
}
