package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.order.Favorites;
import com.liveman.shop.global.ReturnStatus;

public interface FavoritesService {

	/**
	 * �����Ʒ���ղ�
	 * 
	 * @param userId
	 * @param productId
	 */
	ReturnStatus add(int userId, int productId);

	/**
	 * ����Ʒ�Ƴ��ղ�
	 * 
	 * @param userId
	 * @param productId
	 */
	ReturnStatus remove(int userId, int productId);

	/**
	 * ����Ƿ��Ѿ��ղ��˸���Ʒ
	 * 
	 * @param userId
	 * @param productId
	 */
	boolean is(int userId, int productId);

	/**
	 * ͳ�Ƹ���Ʒ���ղش���
	 * 
	 * @param userId
	 * @param productId
	 * @return
	 */
	int count(int productId);

	/**
	 * ��ȡ�û����ղ��б�
	 * 
	 * @param userId
	 * @return
	 */
	List<Favorites> list(int userId);
}
