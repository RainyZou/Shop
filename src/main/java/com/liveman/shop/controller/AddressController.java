package com.liveman.shop.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.liveman.shop.entity.user.Address;
import com.liveman.shop.entity.user.User;
import com.liveman.shop.global.ReturnStatus;
import com.liveman.shop.service.AddressService;

@Controller
@RequestMapping("/user/address")
public class AddressController {

	@Resource
	AddressService addressService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Address> addressList = addressService.list(user.getId());

		ModelAndView m = new ModelAndView("addressList");
		m.addObject("addressList", addressList);
		return m;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView add() {
		return new ModelAndView("addAddress");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(HttpServletResponse response, Address address) {
		ReturnStatus rs = addressService.add(address);
		if (rs.getCode() == 1) {
			return new ModelAndView("redirect:list");
		} else {
			ModelAndView m = new ModelAndView("addAddress");
			m.addObject("address", address);
			m.addObject("message", "ÃÌº”µÿ÷∑ ß∞‹£¨«Î÷ÿ ‘");
			return m;
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(int addressId) {
		Address address = addressService.get(addressId);
		
		ModelAndView m = new ModelAndView("editAddress");
		m.addObject("address", address);
		return m;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(Address address) {
		ReturnStatus rs = addressService.edit(address);
		if (rs.getCode() == 1) {
			return new ModelAndView("redirect:list");
		} else {
			ModelAndView m = new ModelAndView("editAddress");
			m.addObject("address", address);
			m.addObject("message", "–ﬁ∏ƒµÿ÷∑ ß∞‹£¨«Î÷ÿ ‘");
			return m;
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(int addressId) {
		addressService.delete(addressId);
		return new ModelAndView("redirect:list");
	}

	@RequestMapping(value = "/setAsDefault", method = RequestMethod.GET)
	public ModelAndView setAsDefault(int addressId) {
		addressService.setAsDefault(addressId);
		return new ModelAndView("redirect:list");
	}
}
