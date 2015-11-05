package com.liveman.shop.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.Node;
import com.liveman.shop.entity.user.User;
import com.liveman.shop.service.CartService;
import com.liveman.shop.service.NodeService;
import com.liveman.shop.service.ProductService;

@Controller
public class HeaderController {

	@Resource
	CartService cartService;

	@Resource
	ProductService productService;

	@Resource
	NodeService nodeService;

	@RequestMapping(value = "/header")
	public ModelAndView getHeader(HttpSession session) {
		ModelAndView mv = new ModelAndView("header");

		User user = (User) session.getAttribute("user");
		mv.addObject("user", user);
		int count = 0;
		if (user != null) {
			count = cartService.getCartCount(user.getId());
		}

		mv.addObject("count", count);

		Node node = nodeService.getRootTreeNodes();

		mv.addObject("node", node);

		return mv;

	}

}
