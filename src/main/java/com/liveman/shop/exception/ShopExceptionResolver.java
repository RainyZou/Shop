package com.liveman.shop.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
* @Title: ShopExceptionResolver.java
* @Package com.liveman.shop.exception
* @Description: 全局异常处理器
* @author sunny
* @date 2015年10月14日
* @version V1.0
 */
public class ShopExceptionResolver implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			Exception ex) {
		// TODO Auto-generated method stub
		ShopException shopException = null;
		if(ex instanceof ShopException){
			shopException = (ShopException)ex;
		}else{
			shopException = new ShopException("未知错误");
		}
		ModelAndView mv = new ModelAndView();
		System.err.println("错误信息=="+shopException.getMessage());
		mv.addObject("message",shopException.getMessage());
		mv.setViewName("error");
		return mv;
	}
}

class ShopException extends Exception{
	public String message;
	
	public ShopException(String message){
		super(message);
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
