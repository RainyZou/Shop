package com.liveman.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liveman.shop.dao.order.FavoritesMapper;
import com.liveman.shop.entity.order.Favorites;
import com.liveman.shop.entity.order.FavoritesExample;
import com.liveman.shop.global.DateTool;
import com.liveman.shop.global.ReturnStatus;
import com.liveman.shop.service.FavoritesService;

@Service
public class FavoritesServiceImpl implements FavoritesService {

	@Autowired
	FavoritesMapper favoritesMapper;

	@Override
	public ReturnStatus add(int userId, int productId) {
		if (is(userId, productId)) {
			return new ReturnStatus(0, "您已经收藏了该商品!");
		}

		Favorites f = new Favorites();
		f.setUserid(userId);
		f.setProductid(productId);
		f.setCreatetime(DateTool.getCurrentTimeCN());

		int result = favoritesMapper.insert(f);
		return new ReturnStatus(result, result > 0 ? "添加成功!" : "添加失败!");
	}

	@Override
	public ReturnStatus remove(int userId, int productId) {
		if (!is(userId, productId)) {
			return new ReturnStatus(0, "您没有收藏过该商品!");
		}

		FavoritesExample e = new FavoritesExample();
		e.createCriteria().andUseridEqualTo(userId).andProductidEqualTo(productId);
		int result = favoritesMapper.deleteByExample(e);

		return new ReturnStatus(result, result > 0 ? "移除成功!" : "移除失败!");
	}

	@Override
	public boolean is(int userId, int productId) {
		FavoritesExample e = new FavoritesExample();
		e.createCriteria().andUseridEqualTo(userId).andProductidEqualTo(productId);

		List<Favorites> list = favoritesMapper.selectByExample(e);

		return list != null && !list.isEmpty();
	}

	@Override
	public int count(int productId) {
		FavoritesExample e = new FavoritesExample();
		e.createCriteria().andProductidEqualTo(productId);

		return favoritesMapper.selectByExample(e).size();
	}

	@Override
	public List<Favorites> list(int userId) {
		FavoritesExample e = new FavoritesExample();
		e.createCriteria().andUseridEqualTo(userId);

		return favoritesMapper.selectByExample(e);
	}
}
