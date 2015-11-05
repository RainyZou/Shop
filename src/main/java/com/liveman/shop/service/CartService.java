package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.order.Cart;
import com.liveman.shop.entity.order.CartVO;

/**
 * 
* @Description: TODO 
* @Title: CartService.java
* @Package com.liveman.shop.service
* @author A18ccms A18ccms_gmail_com  
* @date 2015年10月16日 上午9:35:34
* @author tec_feng
* @version V1.0
 */
public interface CartService {
	
	public int insertCart(Cart cart);
	
	public int getCartCount(int userId);
	
	public void deleteCartByIds(List<Integer> ids);
	
	public void deleteAllCartsByUserId(int id);
	
	public void updateCartById(int id,int count);
	
	public List<CartVO> findCartsByUserId(int userId);
	
	public List<CartVO> findCartsByProductIds(int userId,List<Integer> ids);
	
	public List<CartVO> findCartsByProductIds(String jsons);
	
	public void mergeCart(int userId,String jsons);
}
