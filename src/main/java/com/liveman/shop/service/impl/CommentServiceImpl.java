package com.liveman.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liveman.shop.dao.user.CommentMapper;
import com.liveman.shop.entity.user.Comment;
import com.liveman.shop.entity.user.CommentExample;
import com.liveman.shop.global.DateTool;
import com.liveman.shop.global.ReturnStatus;
import com.liveman.shop.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper commentMapper;

	@Override
	public ReturnStatus add(Comment comment) {
		CommentExample example = new CommentExample();
		example.createCriteria().andUserIdEqualTo(comment.getUserId()).andProductIdEqualTo(comment.getProductId())
				.andOrderIdEqualTo(comment.getOrderId());

		int result;

		List<Comment> list = commentMapper.selectByExample(example);
		if (!list.isEmpty()) {
			Comment c = list.get(0);
			c.setCommentText(comment.getCommentText());
			c.setStars(comment.getStars());
			c.setCreateTime(DateTool.getCurrentTimeCN());

			result = commentMapper.updateByPrimaryKeySelective(c);
		} else {
			result = commentMapper.insert(comment);
		}

		if (result > 0) {
			return new ReturnStatus(result, "评论成功!");
		} else {
			return new ReturnStatus(result, "评论失败");
		}
	}

	@Override
	public ReturnStatus delete(int id) {
		Comment comment = getById(id);
		if (comment.getCommentId() == null) {
			List<Comment> list = getSubComments(id);
			for (Comment c : list) {
				commentMapper.deleteByPrimaryKey(c.getId());
			}
		}
		int result = commentMapper.deleteByPrimaryKey(id);

		if (result > 0) {
			return new ReturnStatus(result, "删除评论成功!");
		} else {
			return new ReturnStatus(result, "删除评论失败");
		}
	}

	@Override
	public Comment getById(int id) {
		return commentMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Comment> getByProductMain(int productId) {
		CommentExample example = new CommentExample();
		example.createCriteria().andProductIdEqualTo(productId).andCommentIdIsNull();

		return commentMapper.selectByExample(example);
	}

	@Override
	public List<Comment> getByOrderMain(int orderId) {
		CommentExample example = new CommentExample();
		example.createCriteria().andOrderIdEqualTo(orderId).andCommentIdIsNull();

		return commentMapper.selectByExample(example);
	}

	@Override
	public List<Comment> getByUser(int userId) {
		CommentExample example = new CommentExample();
		example.createCriteria().andUserIdEqualTo(userId);

		return commentMapper.selectByExample(example);
	}

	@Override
	public List<Comment> getSubComments(int commentId) {
		CommentExample example = new CommentExample();
		example.createCriteria().andCommentIdEqualTo(commentId);

		return commentMapper.selectByExample(example);
	}
}
