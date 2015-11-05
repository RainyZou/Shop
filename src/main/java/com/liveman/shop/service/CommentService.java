package com.liveman.shop.service;

import java.util.List;

import com.liveman.shop.entity.user.Comment;
import com.liveman.shop.global.ReturnStatus;

public interface CommentService {

	/**
	 * ���Comment
	 * 
	 * @param comment
	 * @return
	 */
	ReturnStatus add(Comment comment);

	/**
	 * ����idɾ��comment���丽��comment
	 * 
	 * @param id
	 * @return
	 */
	ReturnStatus delete(int id);

	/**
	 * ����id��ȡcomment
	 * 
	 * @param id
	 * @return
	 */
	Comment getById(int id);

	/**
	 * ������Ʒid��ȡ������
	 * 
	 * @param productId
	 * @return
	 */
	List<Comment> getByProductMain(int productId);

	/**
	 * ���ݶ���id��ȡ������
	 * 
	 * @param productId
	 * @return
	 */
	List<Comment> getByOrderMain(int orderId);

	/**
	 * �����û�id��ȡ��������������
	 * 
	 * @param userId
	 * @return
	 */
	List<Comment> getByUser(int userId);

	/**
	 * ��������id��ȡ����comment
	 * 
	 * @param commentId
	 * @return
	 */
	List<Comment> getSubComments(int commentId);
}
