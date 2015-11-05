package com.liveman.shop.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.dao.user.CommentMapper;
import com.liveman.shop.entity.user.Comment;
import com.liveman.shop.entity.user.CommentExample;
import com.liveman.shop.global.DateTool;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class CommentMapperTest {

	@Autowired
	CommentMapper commentMapper;

	@Test
	public void testInsert() {
		Comment comment = new Comment();
		comment.setCreateTime(DateTool.getCurrentTimeCN());
		comment.setUserId(1);
		comment.setProductId(1);
		comment.setOrderId(1);
		comment.setStars(5);
		comment.setCommentText("∆¿¬€≤‚ ‘");

		int result = commentMapper.insert(comment);
		Assert.assertEquals(1, result);

	}

	@Test
	public void testSelect() {
		CommentExample example = new CommentExample();
		example.createCriteria().andUserIdEqualTo(1);

		List<Comment> list = commentMapper.selectByExample(example);
		Assert.assertTrue(list.size() > 0);
		if (list.size() > 0) {
			System.out.println("testSelect=" + list.get(0).getUserName());
			Assert.assertEquals(1, (int) list.get(0).getUserId());
		}

	}
}
