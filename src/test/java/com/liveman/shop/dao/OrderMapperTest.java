package com.liveman.shop.dao;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liveman.shop.dao.order.OrderMapper;
import com.liveman.shop.entity.order.OrderStatusEnum;
import com.liveman.shop.entity.order.OrderVO;
import com.liveman.shop.entity.order.PayStyleEnum;
import com.liveman.shop.global.DateTool;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-core-config.xml")
public class OrderMapperTest {

	@Resource
	OrderMapper orderMapper;
	
	@Test
	public void selectAllOrdersTest(){
		List<OrderVO> vos = orderMapper.selectAllOrders(1);
		System.out.println(vos.size());
	}
	
	@Test
	public void selectOrderByIdTest(){
		OrderVO vo = orderMapper.selectOrderById(1);
		System.out.println(vo.getOrder().getOrderId());
	}
	
	@Test
	public void selectOrdersByPayStatusTest(){
		List<OrderVO> vos = orderMapper.selectOrdersByPayStatus(1, "未支付");
		System.out.println(vos.size());
		List<OrderVO> vos1 = orderMapper.selectOrdersByPayStatus(1, "支付");
		System.out.println(vos1.size());
	}
	
	@Test
	public void selectOrdersByOrderStatusTest(){
		List<OrderVO> vos = orderMapper.selectOrdersByOrderStatus(1, "发货");
		System.out.println(vos.size());
	}
	
	@Test
	public void selectOrdersByReceiveStatusTest(){
		List<OrderVO> vos = orderMapper.selectOrdersByReceiveStatus(1, 1);
		System.out.println(vos.size());
	}
	
	@Test
	public void updateEvaluationTest(){
		orderMapper.updateEvaluation(1, 1);
	}
	
	@Test
	public void updatePayStatusTest(){
		orderMapper.updatePayStatus(1, "支付", DateTool.getCurrentTimeCN(), PayStyleEnum.ALIPAY.getStatus());
	}
	
	@Test
	public void updateReceiveStatusTest(){
		orderMapper.updateReceiveStatus(1, 0);
	}
	
//	@Test 
//	public void updateShipStatusTest(){
//		orderMapper.updateShipStatus(OrderStatusEnum.SHIP.getStatus(),1, DateTool.getCurrentTimeCN(), "顺丰快递", "1025425325686");
//	}
}
