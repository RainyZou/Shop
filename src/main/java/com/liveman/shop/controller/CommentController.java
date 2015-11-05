package com.liveman.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.order.OrderDetail;
import com.liveman.shop.entity.order.OrderVO;
import com.liveman.shop.entity.user.Comment;
import com.liveman.shop.entity.user.ProductComment;
import com.liveman.shop.entity.user.User;
import com.liveman.shop.global.DateTool;
import com.liveman.shop.service.CommentService;
import com.liveman.shop.service.OrderService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Resource
	CommentService commentService;
	@Resource
	OrderService orderService;

	@RequestMapping("/add")
	public ModelAndView add(HttpSession session, Comment comment) {
		User user = (User) session.getAttribute("user");
		comment.setUserId(user.getId());
		comment.setCreateTime(DateTool.getCurrentTimeCN());

		System.out.println(comment);

		commentService.add(comment);
		return new ModelAndView("redirect:order?orderId=" + comment.getOrderId());
	}

	@RequestMapping("/product")
	public ModelAndView product(int productId) {
		List<Comment> list = commentService.getByProductMain(productId);
		ModelAndView m = new ModelAndView("user/productCommentList");
		m.addObject("count", list.size());
		m.addObject("comments", list);
		return m;
	}

	@RequestMapping("/order")
	public ModelAndView order(int orderId) {
		List<Comment> list = commentService.getByOrderMain(orderId);
		HashMap<Integer, Comment> commentMap = new HashMap<>();
		for (Comment c : list) {
			commentMap.put(c.getProductId(), c);
		}

		OrderVO order = orderService.get(orderId);
		List<OrderDetail> details = order.getOrder().getDetails();

		List<ProductComment> productComments = new ArrayList<ProductComment>();

		for (OrderDetail od : details) {
			productComments.add(new ProductComment(od.getProduct(), commentMap.get(od.getProduct().getId())));
		}

		ModelAndView m = new ModelAndView("user/orderCommentList");
		m.addObject("orderId", orderId);
		m.addObject("count", productComments.size());
		m.addObject("productComments", productComments);
		return m;
	}

	@RequestMapping("/status")
	public ModelAndView status(int orderId) {
		List<Comment> list = commentService.getByOrderMain(orderId);
		HashMap<Integer, Comment> commentMap = new HashMap<>();
		for (Comment c : list) {
			commentMap.put(c.getProductId(), c);
		}
		OrderVO order = orderService.get(orderId);
		List<OrderDetail> details = order.getOrder().getDetails();

		boolean has = true;
		for (OrderDetail od : details) {
			Comment c = commentMap.get(od.getProduct().getId());
			if (c == null) {
				has = false;
				break;
			}
		}
		ModelAndView m = new ModelAndView("user/commentStatus");
		m.addObject("orderId", orderId);
		m.addObject("commented", has);
		return m;
	}
}
