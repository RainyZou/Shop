package com.liveman.shop.controller;

import java.util.Random;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.liveman.shop.entity.user.User;
import com.liveman.shop.global.ReturnStatus;
import com.liveman.shop.service.CartService;
import com.liveman.shop.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	UserService userService;
	@Resource
	CartService cartService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		String username = "alan" + UUID.randomUUID().toString().substring(0, 8);
		User user = new User();
		user.setUsername(username);
		user.setEmail(username + "@shop.com");
		Random random = new Random();
		String phone = "186";
		for (int i = 0; i < 8; i++) {
			phone += random.nextInt(9);
		}
		user.setPhone(phone);
		user.setPassword("111111");

		ModelAndView m = new ModelAndView("register");
		m.addObject("user", user);
		return m;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(User user) {
		ReturnStatus rs = userService.register(user);
		if (rs.getCode() == 1) {
			ModelAndView m = new ModelAndView("login");
			m.addObject("email", user.getEmail());
			m.addObject("password", user.getPassword());
			return m;
		} else {
			ModelAndView m = new ModelAndView("register");
			m.addObject("user", user);
			m.addObject("errorMessage", rs.getMessage());
			return m;
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {
		Object user = session.getAttribute("user");
		System.out.println(user);

		if (user != null) {
			return new ModelAndView("redirect:/");
		} else {
			return new ModelAndView("login");
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, String email, String password,String hiddenCarts) {
		ReturnStatus rs = userService.login(email, password);
		if (rs.getCode() == 1) {
			User user = (User) rs.getUserData();
			session.setAttribute("user", user);
			cartService.mergeCart(user.getId(), hiddenCarts);
			ModelAndView m = new ModelAndView("order/clearTempCart");
			m.addObject("count",cartService.getCartCount(user.getId()));
			return m ;
		} else {
			ModelAndView m = new ModelAndView("login");
			m.addObject("email", email);
			m.addObject("password", password);
			m.addObject("errorMessage", "邮箱或者密码不正确");
			return m;
		}
	}

	@RequestMapping(value = "/applyResetPassword", method = RequestMethod.GET)
	public ModelAndView applyResetPassword() {
		return new ModelAndView("applyResetPassword");
	}

	@RequestMapping(value = "/applyResetPassword", method = RequestMethod.POST)
	public ModelAndView applyResetPassword(String email) {
		ReturnStatus rs = userService.resetPassword(email);

		ModelAndView m = new ModelAndView("applyResetPassword");
		m.addObject("message", rs.getMessage());
		m.addObject("code", rs.getCode());
		if (rs.getCode() == 1) {
			return m;
		} else {
			m.addObject("email", email);
			return m;
		}
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public ModelAndView resetPassword(String uuid) {
		ReturnStatus rs = userService.checkResetPasswordLink(uuid);

		ModelAndView m = new ModelAndView("resetPassword");
		m.addObject("uuid", uuid);
		m.addObject("message", rs.getMessage());
		return m;
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public ModelAndView resetPassword(String uuid, String password) {
		ReturnStatus rs = userService.resetPassword(uuid, password);

		ModelAndView m = new ModelAndView("resetPassword");
		m.addObject("code", rs.getCode());
		m.addObject("message", rs.getMessage());
		return m;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("user");
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/checkUsername", method = RequestMethod.GET)
	public @ResponseBody String checkUsername(Integer userId, String username) {
		ReturnStatus rs = userService.checkUsername(userId, username);
		return String.valueOf(rs.getCode() == 1);
	}

	@RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
	public @ResponseBody String checkEmail(Integer userId, String email) {
		ReturnStatus rs = userService.checkEmail(userId, email);
		return String.valueOf(rs.getCode() == 1);
	}

	@RequestMapping(value = "/checkPhone", method = RequestMethod.GET)
	public @ResponseBody String checkPhone(Integer userId, String phone) {
		ReturnStatus rs = userService.checkPhone(userId, phone);
		return String.valueOf(rs.getCode() == 1);
	}

	@RequestMapping(value = "/checkYanzhengma", method = RequestMethod.GET)
	public @ResponseBody String checkYanzhengma(HttpSession session, String yanzhengma) {
		String yanzhengmaSession = (String) session.getAttribute("yanzhengma");
		return String.valueOf(yanzhengma.equals(yanzhengmaSession));
	}

	@RequestMapping(value = "/personal", method = RequestMethod.GET)
	public ModelAndView personal() {
		return new ModelAndView("personal");
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public ModelAndView changePassword() {
		return new ModelAndView("changePassword");
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public ModelAndView changePassword(HttpSession session, int userId, String oldPwd, String newPwd) {
		ReturnStatus rs = userService.changePassword(userId, oldPwd, newPwd);

		updateUserSession(session);

		ModelAndView m = new ModelAndView("changePassword");
		m.addObject("message", rs.getMessage());
		m.addObject("code", rs.getCode());
		return m;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpSession session, User user) {
		ReturnStatus rs = userService.edit(user);

		updateUserSession(session);

		ModelAndView m = new ModelAndView("redirect:personal");
		// 这里没有传递User对象到界面，是因为Session中有，而页面会自动从session中取
		m.addObject("message", rs.getMessage());
		m.addObject("code", rs.getCode());
		return m;
	}

	private void updateUserSession(HttpSession session) {
		User user = (User) session.getAttribute("user");
		user = userService.get(user.getId());
		session.setAttribute("user", user);
	}
}
