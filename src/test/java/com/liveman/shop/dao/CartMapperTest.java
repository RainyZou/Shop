package com.liveman.shop.dao;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.dao.order.CartMapper;
import com.liveman.shop.entity.order.Cart;
import com.liveman.shop.entity.order.CartVO;
import com.liveman.shop.global.DateTool;
import com.liveman.shop.service.impl.CartServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class CartMapperTest {
	
	@Autowired
	CartMapper cartMapper;
	
	@Resource
    CartServiceImpl cartService;
	
	@Test
	public void testInsert(){
		
		Cart cart = new Cart();
		cart.setCreateTime(DateTool.getCurrentDateCN());
		cart.setUserId(1);
		cart.setProductCount(2);
		
		for(int i=3;i<10;i++){
			cart.setProductId(i);
			cartMapper.insertCart(cart);
		}
		
	}
	
	@Test
	public void testDeleteCartByIds(){
		List<Integer> ids = new ArrayList<>();
		ids.add(1);
		ids.add(2);
		ids.add(3);
		ids.add(4);
		cartMapper.deleteCartByIds(ids);
	}
	
	@Test
	public void testDeleteAllCartsByUserId(){
		cartMapper.deleteAllCartsByUserId(1);
	}
	
	@Test
	public void testUpdateCartById(){
		Cart cart = new Cart();
		cart.setId(8);
		cart.setCreateTime(DateTool.getCurrentDateCN());
		cart.setUserId(3);
		cart.setProductCount(333);
		cart.setProductId(3333);
		cartMapper.updateCartById(cart);
	}
	
	@Test
	public void testFindCartsByUserId(){
		List<CartVO> carts = cartMapper.findCartsByUserId(1);
		for (CartVO cart : carts) {
			System.out.println(cart);
		}
	}
	
	@Test
	public void testFindCartsByProductIds(){
		List<Integer> ids  = new ArrayList<>();
		ids.add(4);
		ids.add(5);
		ids.add(6);
		List<CartVO> carts = cartMapper.findCartsByProductIds(1, ids);
		for (CartVO cart : carts) {
			System.out.println(cart);
		}
	}
	
	@Test
	public void testFindCartCount(){
		int count = cartMapper.findCartCount(1);
		System.out.println(count);
	}
	
	@Test
	public void testFindCartByProductId(){
		Cart cart = new Cart();
		cart.setUserId(3);
		cart.setProductId(3333);
		Cart cart2 = cartMapper.findCartByProductId(cart);
		System.out.println(cart2);
		
		cart.setUserId(1);
		Cart cart3 = cartMapper.findCartByProductId(cart);
		System.out.println(cart3);
	}
	
	@Test
	public void testServiceFindCartsByUserId(){
		List<CartVO> carts = cartService.findCartsByUserId(1);
		for (CartVO cart : carts) {
			System.out.println(cart);
		}
	}
}
