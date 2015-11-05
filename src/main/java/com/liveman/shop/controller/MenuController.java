package com.liveman.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.MenuItem;
import com.liveman.shop.entity.Node;
import com.liveman.shop.entity.product.Category;
import com.liveman.shop.entity.product.Product;
import com.liveman.shop.service.CategoryService;
import com.liveman.shop.service.NodeService;
import com.liveman.shop.service.ProductService;

@Controller
@RequestMapping(value = "menu")
public class MenuController {

	@Resource
	NodeService nodeService;
	@Resource
	ProductService productService;
	@Resource
	CategoryService categoryService;

	@RequestMapping(value = "list")
	public ModelAndView setMenu() {
		ModelAndView mv = new ModelAndView();
		List<Node> nodes = nodeService.getNodeRootList();

		Product p = new Product();
		p.setType("post");
		List<Product> posts = productService.getProductByProduct(p, 0, 20);
		List<Category> categorys = categoryService.getRootCategoryList();
		p.setType("product");
		List<Product> products = productService.getProductByProduct(p, 0, 20);
		mv.addObject("nodes", nodes);
		mv.addObject("posts", posts);
		mv.addObject("categorys", categorys);
		mv.addObject("products", products);
		mv.setViewName("menuModify");
		return mv;
	}

	@RequestMapping(value = "list/add", method = RequestMethod.POST)
	public ModelAndView saveMenu(String[] menuNames, String[] levels, String[] urls, String[] types) {
		List<MenuItem> menuItems = new ArrayList<>();
		List<Integer> li = new ArrayList<>();
		for (int i = 1; i < menuNames.length; i++) {
			MenuItem item = new MenuItem();
			item.setName(menuNames[i]);
			item.setType(types[i]);
			item.setUrl(urls[i]);
			li.add(Integer.parseInt(levels[i]));
			menuItems.add(item);
		}
		nodeService.saveMenu(li, menuItems); 
		return setMenu();
	}

}
