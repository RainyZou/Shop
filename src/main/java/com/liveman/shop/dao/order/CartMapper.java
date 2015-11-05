package com.liveman.shop.dao.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liveman.shop.entity.order.Cart;
import com.liveman.shop.entity.order.CartVO;

public interface CartMapper {
	public void insertCart(Cart cart);
	
	public void deleteCartByIds(List<Integer> ids);
	
	public void deleteAllCartsByUserId(int userId);
	
	public void updateCartById(Cart cart);
	
	public List<CartVO> findCartsByUserId(int userId);
	
	public List<CartVO> findCartsByProductIds(@Param("userId")int userId,@Param("ids")List<Integer> ids);
	
	public int findCartCount(int userId);
	
	public Cart findCartById(int id);
	
	public Cart findCartByProductId(Cart cart);
}
