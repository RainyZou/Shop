package com.liveman.shop.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.liveman.shop.dao.order.CartMapper;
import com.liveman.shop.entity.order.Cart;
import com.liveman.shop.entity.order.CartJson;
import com.liveman.shop.entity.order.CartVO;
import com.liveman.shop.entity.product.Product;
import com.liveman.shop.global.DateTool;
import com.liveman.shop.service.CartService;
import com.liveman.shop.service.ProductService;

@Component("cartService")
public class CartServiceImpl implements CartService{
	
	@Resource
	CartMapper dao;
	@Autowired
	ProductService productService;
	
	@Override
	public int insertCart(Cart cart) {
		Cart temp = dao.findCartByProductId(cart);
		if(temp != null){
			int productCount = temp.getProductCount();
			temp.setProductCount(productCount+cart.getProductCount());
			dao.updateCartById(temp);
		}else{
			dao.insertCart(cart);
		}
		int count = dao.findCartCount(cart.getUserId());
		return count;
		
	}

	@Override
	public void deleteCartByIds(List<Integer> ids) {
		if(ids.size()!=0){
			dao.deleteCartByIds(ids);
		}
	}

	@Override
	public void updateCartById(int id, int count) {
		Cart temp = dao.findCartById(id);
		temp.setProductCount(count);
		dao.updateCartById(temp);
	}

	@Override
	public List<CartVO> findCartsByUserId(int userId) {
		List<CartVO> carts = dao.findCartsByUserId(userId);
		return carts;
	}

	@Override
	public void deleteAllCartsByUserId(int userId) {
		dao.deleteAllCartsByUserId(userId);
	}

	@Override
	public int getCartCount(int userId) {
		int count = dao.findCartCount(userId);
		return count;
	}

	@Override
	public List<CartVO> findCartsByProductIds(int userId, List<Integer> ids) {
		List<CartVO> vos = new ArrayList<>();
		if(ids.size() !=0){
			vos = dao.findCartsByProductIds(userId, ids);
		}
		return vos;
	}

	@Override
	public List<CartVO> findCartsByProductIds(String jsons) {
		if(jsons == null ||"".equals(jsons.trim())){
			return new ArrayList<CartVO>();
		}
		List<CartJson> cartJsons = jsonToList(jsons);
		List<Integer> productIds = new ArrayList<>();
		 for(CartJson json : cartJsons){
			 productIds.add(json.getProductId());
		 }
		Map<Integer,Product> maps = productService.getSimpleProductByIds(productIds);
		List<CartVO> vos = new ArrayList<>();
		for(CartJson json : cartJsons){
			CartVO vo = new CartVO();
			Cart cart = new Cart();
			cart.setProductId(json.getProductId());
			cart.setProductCount(json.getCount());
			vo.setCart(cart);
			vo.setProduct(maps.get(json.getProductId()));
			vos.add(vo);
		}
		return vos;
	}

	@Override
	public void mergeCart(int userId,String jsons) {
		if(jsons == null ||"".equals(jsons.trim())){
			return;
		}
		List<CartJson> cartJsons = jsonToList(jsons);
		Cart cart = new Cart();
		 for(CartJson json : cartJsons){
			 cart.setCreateTime(DateTool.getCurrentDateCN());
			 cart.setUserId(userId);
			 cart.setProductCount(json.getCount());
			 cart.setProductId(json.getProductId());
			 insertCart(cart);
		 }
	}
	
	private List<CartJson> jsonToList(String jsons){
		jsons = jsons.replace("THX", "");
		jsons = jsons.substring(0, jsons.lastIndexOf(",")) +"]";
		ObjectMapper mapper = new ObjectMapper();  
		List<CartJson> cartJsons = new ArrayList<>();
		 try {
			 cartJsons = mapper.readValue(jsons, new TypeReference<List<CartJson>>() {});
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return cartJsons;
	}

}
