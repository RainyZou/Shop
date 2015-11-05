package com.liveman.shop.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
* @Title: ShopExceptionResolver.java
* @Package com.liveman.shop.exception
* @Description: ȫ���쳣������
* @author sunny
* @date 2015��10��14��
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
			shopException = new ShopException("δ֪����");
		}
		ModelAndView mv = new ModelAndView();
		System.err.println("������Ϣ=="+shopException.getMessage());
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
