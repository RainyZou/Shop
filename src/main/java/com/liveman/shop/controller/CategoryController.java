package com.liveman.shop.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.product.Category;
import com.liveman.shop.service.CategoryService;

@Controller
@RequestMapping(value = "category")
public class CategoryController {

	@Resource
	CategoryService categoryService;

	@RequestMapping(value = {"admin/list","admin"})
	public ModelAndView getCategoryList() {
		ModelAndView mv = new ModelAndView("categoryList");
		Category category = categoryService.getCategoryById(1);
		category.getChildren().remove(0);
		List<Category> categoryList = category.getChildren();

		mv.addObject("categoryList", categoryList);

		return mv;

	}

	@RequestMapping(value = "admin/add")
	public ModelAndView addCategory(String cname, @RequestParam(defaultValue = "1") int parentId) {

		if (cname != null && !cname.equalsIgnoreCase("")) {
			Category c = new Category();
			c.setCname(cname);
			c.setParent(categoryService.getSingleCategory(parentId));
			categoryService.addCategory(c);
		}
		return getCategoryList();
	}

	@RequestMapping(value = "admin/action")
	public ModelAndView deleteCategory(String[] ids, String action) {
		
		if ("delete".equalsIgnoreCase(action)) {
			// TODO: 这个需要处理删除功能
		}
		return getCategoryList();
	}

}
