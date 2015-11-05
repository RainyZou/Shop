package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.user.Comment;
import com.liveman.shop.global.ReturnStatus;

public interface CommentService {

	/**
	 * 添加Comment
	 * 
	 * @param comment
	 * @return
	 */
	ReturnStatus add(Comment comment);

	/**
	 * 根据id删除comment及其附属comment
	 * 
	 * @param id
	 * @return
	 */
	ReturnStatus delete(int id);

	/**
	 * 根据id获取comment
	 * 
	 * @param id
	 * @return
	 */
	Comment getById(int id);

	/**
	 * 根据商品id获取主评论
	 * 
	 * @param productId
	 * @return
	 */
	List<Comment> getByProductMain(int productId);

	/**
	 * 根据订单id获取主评论
	 * 
	 * @param productId
	 * @return
	 */
	List<Comment> getByOrderMain(int orderId);

	/**
	 * 根据用户id获取其名下所有评论
	 * 
	 * @param userId
	 * @return
	 */
	List<Comment> getByUser(int userId);

	/**
	 * 根据评论id获取其子comment
	 * 
	 * @param commentId
	 * @return
	 */
	List<Comment> getSubComments(int commentId);
}
