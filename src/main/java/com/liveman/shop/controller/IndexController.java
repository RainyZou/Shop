package com.liveman.shop.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.product.Product;
import com.liveman.shop.service.ProductService;

@Controller
public class IndexController {

	@Resource
	ProductService service;

	@RequestMapping(value = "/")
	public ModelAndView getIndexMap() {
		ModelAndView mv = new ModelAndView("first");

		List<Product> latestList = service.getLatestProduct();
		List<Product> topSeller = service.getTopSellerProduct(6);
		List<Product> suggest = service.getSuggestProduct(6);

		mv.addObject("latestList", latestList);
		mv.addObject("topSeller", topSeller);
		mv.addObject("suggest", suggest);

		return mv;

	}

}
