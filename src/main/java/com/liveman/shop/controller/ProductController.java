package com.liveman.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.order.ProductBuyHistoryVO;
import com.liveman.shop.entity.product.Category;
import com.liveman.shop.entity.product.Picture;
import com.liveman.shop.entity.product.Product;
import com.liveman.shop.global.DateTool;
import com.liveman.shop.service.CategoryService;
import com.liveman.shop.service.ProductService;
import com.liveman.shop.service.PushService;

@Controller
@RequestMapping({ "{actionType}" })
public class ProductController {

	@Resource
	ProductService productService;

	@Resource
	CategoryService categoryService;

	@Resource
	PushService pushServic;

	@RequestMapping("/product")
	public ModelAndView singleProduct(int id, @PathVariable String actionType) {
		ModelAndView mv = new ModelAndView(actionType);

		if ("post".equalsIgnoreCase(actionType)) {
			Product p = productService.getProductById(id);

			mv.addObject("post", p);
		} else {
			Product p = productService.getProductById(id);

			List<Product> suggest = productService.getSuggestProduct(6);
			List<Product> topSeller = productService.getTopSellerProduct(6);
			List<Product> relate = productService.getRelateProduct(id, 3);
			List<ProductBuyHistoryVO> history = pushServic.productBuyHistory(id);

			mv.addObject("product", p);
			mv.addObject("suggest", suggest);
			mv.addObject("topSeller", topSeller);
			mv.addObject("relate", relate);
			mv.addObject("history", history);
		}
		return mv;

	}

	@RequestMapping(value = "/productList")
	public ModelAndView productList(int id, @RequestParam(defaultValue = "0") int page) {

		ModelAndView mv = new ModelAndView("productList");
		int pagesize = 12;
		int pageCount = productService.getCountByCategoryId(id);

		List<Product> pList = productService.getProductByCategoryId(id, page * pagesize, pagesize);

		List<Product> suggest = productService.getTopSellerProduct(3);

		Category rootCategory = categoryService.getRootCategory();
		Category category = categoryService.getCategoryById(id);
		mv.addObject("pcount", pageCount);
		mv.addObject("pagesize", pagesize);
		mv.addObject("page", page);
		mv.addObject("pList", pList);
		mv.addObject("categoryId", id);
		mv.addObject("rootCategory", rootCategory);
		mv.addObject("suggest", suggest);

		return mv;
	}

	@RequestMapping(value = "/admin/add", method = RequestMethod.GET)
	public ModelAndView productAddPage(@RequestParam(defaultValue = "0") int id, @PathVariable String actionType) {

		ModelAndView mv = new ModelAndView();
		Product product = new Product();
		if (id != 0) {
			product = productService.getProductById(id);
			String details = JSONObject.valueToString(product.getDetails());
			product.setDetails(details.substring(1, details.length() - 1));
			String shortDescription = JSONObject.valueToString(product.getShortDescription());
			product.setShortDescription(shortDescription.substring(1, shortDescription.length() - 1));
			System.out.println(product.getDetails());
			mv.addObject("product", product);
		}
		if ("product".equalsIgnoreCase(actionType)) {
			mv.setViewName("addProduct");
		} else if ("post".equalsIgnoreCase(actionType)) {
			mv.setViewName("addPost");
		}

		Category rootCategory = categoryService.getCategoryById(1);
		mv.addObject("rootCategory", rootCategory);

		return mv;

	}

	@RequestMapping(value = "/admin/add", method = RequestMethod.POST)
	public String addProductLogic(String categorys, @RequestParam(defaultValue = "0") int id, String name,
			String details, String shortDescription, String defaultPicturePath,
			@RequestParam(required = false) String[] pictures, @RequestParam(defaultValue = "0") double standardPrice,
			@RequestParam(defaultValue = "0") double currentPrice, @PathVariable String actionType) {
		Product p = new Product();
		String[] args = categorys.split(",");
		List<Category> cList = new ArrayList<>();

		for (String string : args) {
			try {
				int categoryId = Integer.parseInt(string);
				Category c = categoryService.getCategoryById(categoryId);
				cList.add(c);
			} catch (Exception e) {
				continue;
			}
		}
		List<Picture> lp = new ArrayList<>();

		if (pictures != null) {
			for (String picture : pictures) {
				Picture pc = new Picture();
				pc.setPicturePath(picture);
				lp.add(pc);
			}
		}
		p.setPictures(lp);
		p.setType(actionType);
		p.setCurrentPrice(currentPrice);
		p.setStandardPrice(standardPrice);
		p.setDefaultPicturePath(defaultPicturePath);
		p.setName(name);
		p.setShortDescription(shortDescription);
		p.setDetails(details);
		p.setCategorys(cList);

		p.setDatetime(DateTool.getCurrentTimeNoZone());

		if (id == 0) {
			productService.addProduct(p);
		} else {
			p.setId(id);
			productService.updateProduct(p);
		}

		return "redirect:/" + actionType + "/admin/add?id=" + p.getId();
	}

	@RequestMapping(value = "/search")
	public ModelAndView search(String keyword, @RequestParam(defaultValue = "0") int page) {

		ModelAndView mv = new ModelAndView("productList");
		int pagesize = 12;
		int pageCount = productService.getCountByKeyword(keyword);

		List<Product> pList = productService.getProductByKeyword(keyword, page * pagesize, pagesize);

		List<Product> suggest = productService.getTopSellerProduct(3);

		Category rootCategory = categoryService.getRootCategory();

		mv.addObject("pcount", pageCount);
		mv.addObject("pagesize", pagesize);
		mv.addObject("page", page);
		mv.addObject("pList", pList);
		mv.addObject("keyword", keyword);
		mv.addObject("rootCategory", rootCategory);
		mv.addObject("suggest", suggest);

		return mv;
	}

	@RequestMapping("/admin/list")
	public ModelAndView productManager(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int pagesize, @PathVariable String actionType) {
		ModelAndView mv = new ModelAndView("admin" + actionType + "List");

		int pageCount = productService.getCountByCondition("", actionType);

		Product p = new Product();
		p.setType(actionType);

		List<Product> pList = productService.getProductByProduct(p, page * pagesize, pagesize);

		mv.addObject("pcount", pageCount);
		mv.addObject("pagesize", pagesize);
		mv.addObject("page", page);
		mv.addObject("pList", pList);

		if ("post".equalsIgnoreCase(actionType)) {
			mv.setViewName("adminPostList");
		} else if ("product".equalsIgnoreCase(actionType)) {
			mv.setViewName("adminProductList");
		}

		return mv;

	}

}
