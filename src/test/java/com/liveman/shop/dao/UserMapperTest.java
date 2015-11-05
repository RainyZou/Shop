package com.liveman.shop.dao;
import java.util.List;
import java.util.UUID;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.liveman.shop.dao.user.UserMapper;
import com.liveman.shop.entity.Teacher;
import com.liveman.shop.entity.user.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class UserMapperTest {
	@Autowired
	UserMapper userMapper;

	@Test
	public void testSelect() {
		List<User> list = userMapper.selectByExample(null);
		for (User user : list) {
			System.out.println(user);
		}
	}
	

	@Test
	public void testInsert() {
		String username ="alan"+UUID.randomUUID().toString().substring(0, 8);
		User user =new User();
		user.setUsername(username);
		user.setEmail(username+"@shop.com");
		user.setPhone("18688163698");
		user.setPassword("alan2015");
		user.setStatus("yes");
		int result = userMapper.insert(user);
		Assert.assertEquals(1, result);
	}
}
