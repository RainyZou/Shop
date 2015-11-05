package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.order.Favorites;
import com.liveman.shop.global.ReturnStatus;

public interface FavoritesService {

	/**
	 * 添加商品到收藏
	 * 
	 * @param userId
	 * @param productId
	 */
	ReturnStatus add(int userId, int productId);

	/**
	 * 将商品移出收藏
	 * 
	 * @param userId
	 * @param productId
	 */
	ReturnStatus remove(int userId, int productId);

	/**
	 * 检查是否已经收藏了该商品
	 * 
	 * @param userId
	 * @param productId
	 */
	boolean is(int userId, int productId);

	/**
	 * 统计该商品的收藏次数
	 * 
	 * @param userId
	 * @param productId
	 * @return
	 */
	int count(int productId);

	/**
	 * 获取用户的收藏列表
	 * 
	 * @param userId
	 * @return
	 */
	List<Favorites> list(int userId);
}
