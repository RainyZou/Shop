package com.liveman.shop.controller;

import java.text.DecimalFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.order.CartVO;
import com.liveman.shop.entity.order.PreOrderVO;
import com.liveman.shop.entity.user.User;
import com.liveman.shop.service.OrderService;
import com.liveman.shop.service.PreOrderService;

@Controller
@RequestMapping("/order")
public class PreOrderController {

	@Resource
	PreOrderService preOrderService;
	
	
	@RequestMapping("preView")
	public ModelAndView preViewOrder(HttpSession session){
		User user = (User)session.getAttribute("user");
		ModelAndView mView = new ModelAndView();
		PreOrderVO preVO =  preOrderService.getPreOrder(user.getId());
		double all = 0;
		for (CartVO cartVO : preVO.getCartVOs()) {
			int count = cartVO.getCart().getProductCount();
			double temp = cartVO.getProduct().getCurrentPrice()*count;
			all +=temp;
		}
		DecimalFormat format =new DecimalFormat("#0.0");
		all = Double.parseDouble(format.format(all));
		mView.addObject("all",all);
		mView.addObject("preVO", preVO);
		mView.setViewName("order/order");
		return mView;
	}
}
