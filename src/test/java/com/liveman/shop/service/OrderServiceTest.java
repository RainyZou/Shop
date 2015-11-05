package com.liveman.shop.service;
import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.service.OrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class OrderServiceTest {
	
	@Resource
	OrderService orderService;
	
	@Test
	public void insertOrderTest(){
		for(int i=0;i<10;i++){
			orderService.addOrder(7, "给我发邮政快递"+i, 1, new Integer[]{7,8,9});
		}
		
	}
}
