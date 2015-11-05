package com.liveman.shop.controller;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.order.OrderVO;
import com.liveman.shop.entity.user.User;
import com.liveman.shop.express.Express;
import com.liveman.shop.service.CartService;
import com.liveman.shop.service.ExpressService;
import com.liveman.shop.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Resource
	public OrderService orderService;
	@Resource
	public ExpressService expressService;
	@Resource
	public CartService cartService;
	
	@RequestMapping("submit")
	public ModelAndView submitOrder(int address,String comment,Integer[] productIds,Integer[] cartIds,HttpSession session){
		User user = (User)session.getAttribute("user");
		int userId = user.getId();
		orderService.addOrder(address, comment, userId, productIds);
		
		cartService.deleteCartByIds(Arrays.asList(cartIds));
		ModelAndView mView = new ModelAndView();
		mView.addObject("orderVO", new OrderVO());
		mView.setViewName("order/payDetail");
		return mView;
	}
	
	@RequestMapping("manager")
	public ModelAndView managerOrder(String searchType,HttpSession session){
		User user = (User)session.getAttribute("user");
		int userId = user.getId();
		ModelAndView mView = new ModelAndView();
		List<OrderVO> vos = orderService.managerOrder(userId, searchType);
		mView.addObject("vos", vos);
		mView.setViewName("order/orderManager");
		return mView;
	}
	
	@RequestMapping("cancel")
	public ModelAndView cancelOrder(int orderId,HttpSession session){
		System.err.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		orderService.cancelOrder(orderId);
		ModelAndView mView = new ModelAndView();
		mView.setViewName("order/orderManager");
		User user = (User)session.getAttribute("user");
		int userId = user.getId();
		List<OrderVO> vos = orderService.managerOrder(userId, "ALL");
		mView.addObject("vos", vos);
		return mView;
	}
	
	@RequestMapping("restore")
	public ModelAndView restoreOrder(int orderId,HttpSession session){
		orderService.restoreOrder(orderId);
		ModelAndView mView = new ModelAndView();
		mView.setViewName("order/orderManager");
		User user = (User)session.getAttribute("user");
		int userId = user.getId();
		List<OrderVO> vos = orderService.managerOrder(userId, "ALL");
		mView.addObject("vos", vos);
		return mView;
	}
	
	@RequestMapping("detail")
	public ModelAndView detail(int orderId){
		OrderVO vo = orderService.get(orderId);
		ModelAndView mView = new ModelAndView("order/orderDetail");
		mView.addObject("vo",vo);
		Express express = expressService.expressDetail(vo.getOrder().getShipOrderNumber(), vo.getOrder().getShipName());
		mView.addObject("express",express);
		return mView;
	}
	
	
}
