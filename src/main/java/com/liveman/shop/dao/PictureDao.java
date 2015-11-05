package com.liveman.shop.dao;

import java.util.List;

import com.liveman.shop.entity.product.Picture;

public interface PictureDao {

	public List<Picture> getPictureListByProductId(int productId);

}
