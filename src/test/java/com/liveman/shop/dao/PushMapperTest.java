package com.liveman.shop.dao;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.dao.order.PushMapper;
import com.liveman.shop.entity.order.ProductBuyHistoryVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class PushMapperTest {
	
	@Resource
	PushMapper pushMapper;
	
	@Test
	public void selectProductBuyHistoryTest(){
		List<ProductBuyHistoryVO> vos = pushMapper.selectProductBuyHistory(4);
		System.out.println(vos.size());
	}
}
