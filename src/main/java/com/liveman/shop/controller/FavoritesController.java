package com.liveman.shop.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.order.Favorites;
import com.liveman.shop.entity.product.Product;
import com.liveman.shop.entity.user.User;
import com.liveman.shop.global.ReturnStatus;
import com.liveman.shop.service.FavoritesService;
import com.liveman.shop.service.ProductService;

@Controller
@RequestMapping("/favorites")
public class FavoritesController {
	@Resource
	FavoritesService favoritesService;
	@Resource
	ProductService productService;

	@RequestMapping("add")
	public @ResponseBody ReturnStatus add(HttpSession session, int productId) {
		int userId = ((User) session.getAttribute("user")).getId();
		return favoritesService.add(userId, productId);
	}

	@RequestMapping("remove")
	public @ResponseBody ReturnStatus remove(HttpSession session, int productId) {
		int userId = ((User) session.getAttribute("user")).getId();
		return favoritesService.remove(userId, productId);
	}

	@RequestMapping("removeinlist")
	public ModelAndView removeinlist(HttpSession session, int productId) {
		int userId = ((User) session.getAttribute("user")).getId();
		favoritesService.remove(userId, productId);

		return new ModelAndView("redirect:list");
	}

	@RequestMapping("status")
	public ModelAndView status(HttpSession session, int productId) {
		int userId = ((User) session.getAttribute("user")).getId();
		boolean is = favoritesService.is(userId, productId);
		int count = favoritesService.count(productId);

		ModelAndView m = new ModelAndView("favoritesStatus");
		m.addObject("status", is);
		m.addObject("productId", productId);
		m.addObject("count", count);
		return m;
	}

	@RequestMapping("product")
	public ModelAndView product(int productId) {
		Product product = productService.getProductById(productId);

		ModelAndView m = new ModelAndView("favoritesProduct");
		m.addObject("product", product);
		return m;
	}

	@RequestMapping("is")
	public @ResponseBody boolean is(HttpSession session, int productId) {
		int userId = ((User) session.getAttribute("user")).getId();
		return favoritesService.is(userId, productId);
	}

	@RequestMapping("list")
	public ModelAndView list(HttpSession session) {
		int userId = ((User) session.getAttribute("user")).getId();
		List<Favorites> list = favoritesService.list(userId);

		ModelAndView m = new ModelAndView("favoritesList");
		m.addObject("count", list.size());
		m.addObject("favorites", list);
		return m;
	}
}
