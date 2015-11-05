package com.liveman.shop.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.order.Cart;
import com.liveman.shop.entity.order.CartVO;
import com.liveman.shop.entity.user.User;
import com.liveman.shop.global.DateTool;
import com.liveman.shop.global.ReturnStatus;
import com.liveman.shop.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Resource
	public CartService cartService;

	@RequestMapping("list")
	public ModelAndView cartList(HttpSession session, String param) {
		User user = (User) session.getAttribute("user");
		ModelAndView mView = new ModelAndView();
		List<CartVO> list = new ArrayList<>();
		mView.setViewName("checkout");
		if (user != null) {
			int userId = user.getId();
			list = cartService.findCartsByUserId(userId);
		} else {
			list = cartService.findCartsByProductIds(param);
		}
		double standardAll = 0;
		double cutAll = 0;
		for (CartVO cartVO : list) {
			int count = cartVO.getCart().getProductCount();
			double standard = cartVO.getProduct().getStandardPrice() * count;
			double current = cartVO.getProduct().getCurrentPrice() * count;
			standardAll += standard;
			cutAll += (standard - current);
		}
		DecimalFormat format = new DecimalFormat("#0.0");
		standardAll = Double.parseDouble(format.format(standardAll));
		cutAll = Double.parseDouble(format.format(cutAll));

		mView.addObject("cartsVO", list);
		mView.addObject("count", list.size());
		mView.addObject("standardAll", standardAll);
		mView.addObject("cutAll", cutAll);
		mView.addObject("all", format.format(standardAll - cutAll));
		return mView;

	}

	@RequestMapping("add")
	public @ResponseBody HashMap<String, Integer> addProduct(HttpSession session, int productId) {
		Cart cart = new Cart();
		cart.setCreateTime(DateTool.getCurrentDateCN());
		User user = (User) session.getAttribute("user");
		cart.setUserId(user.getId());
		cart.setProductCount(1);
		cart.setProductId(productId);
		int count = cartService.insertCart(cart);
		HashMap<String, Integer> maps = new HashMap<>();
		maps.put("count", count);
		return maps;
	}

	@RequestMapping("update")
	public @ResponseBody int updateCarts(int id, int count) {
		cartService.updateCartById(id, count);
		return count;
	}

	@RequestMapping("delete")
	public @ResponseBody ReturnStatus deleteCart(int id, HttpSession session) {
		List<Integer> ids = new ArrayList<>();
		ids.add(id);
		cartService.deleteCartByIds(ids);
		ReturnStatus status = new ReturnStatus(1, "É¾³ý³É¹¦");
		User user = (User) session.getAttribute("user");
		int userId = user.getId();
		int count = cartService.getCartCount(userId);
		status.setUserData(count);
		return status;
	}

}
