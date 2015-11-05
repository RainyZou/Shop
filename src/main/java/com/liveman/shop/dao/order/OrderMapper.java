package com.liveman.shop.dao.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liveman.shop.entity.order.Order;
import com.liveman.shop.entity.order.OrderDetail;
import com.liveman.shop.entity.order.OrderVO;

/**
 * 
* @Title: OrderMapper.java
* @Package com.liveman.shop.dao.order
* @Description: ����dao�����
* @author sunny
* @date 2015��10��22��
* @version V1.0
 */
public interface OrderMapper {
	
	/**
	 * ���붩��
	 * @param ����
	 */
	public void insertOrder(Order order);
	
	/**
	 * ���붩������
	 * @param details ��������
	 */
	public void insertOrderDetail(List<OrderDetail> details);
	
	/**
	 * ͨ��userId��ѯ���ж���
	 * @param userId  �û�id
	 * @return  orderVO list����View��չʾ
	 */
	public List<OrderVO> selectAllOrders(int userId);
	
	/**
	 * ͨ������id��ѯ
	 * @param orderId  ����id
	 * @return orderVO
	 */
	public OrderVO selectOrderById(int orderId);
	
	/**
	 * ͨ��֧��״̬��ѯ
	 * @param userId	�û�id
	 * @param payStatus	֧��״̬
	 * @return	orderVO list����View��չʾ
	 */
	public List<OrderVO> selectOrdersByPayStatus(@Param("userId")int userId,@Param("payStatus")String payStatus);
	
	/**
	 * ͨ������״̬��ѯ
	 * @param userId �û�id
	 * @param orderStatus	����״̬
	 * @return
	 */
	public List<OrderVO> selectOrdersByOrderStatus(@Param("userId")int userId,@Param("orderStatus")String orderStatus);
	
	/**
	 * ͨ������״̬��ѯ
	 * @param userId �û�id
	 * @return
	 */
	public List<OrderVO> selectOrdersByCancelStatus(@Param("userId")int userId);
	
	/**
	 * ͨ���ջ�״̬��ѯ
	 * @param userId	�û�id
	 * @param receiveStatus	�ջ�״̬
	 * @return
	 */
	public List<OrderVO> selectOrdersByReceiveStatus(@Param("userId")int userId,@Param("receiveStatus")int receiveStatus);
	
	/**
	 * ��ѯδ���۵Ķ���
	 * @param userId
	 * @return
	 */
	public List<OrderVO> selectOrdersByEvaluation(@Param("userId")int userId);
	
	/**
	 * ��������
	 * @param orderId	����id
	 * @param evaluationId	����id
	 */
	public void updateEvaluation(@Param("id")int id,@Param("evaluationId")int evaluationId);
	
	/**
	 * ����֧��״̬��ʱ��
	 * @param orderId	����id
	 * @param payStatus	֧��״̬
	 * @param payTime	֧��ʱ��
	 */
	public void updatePayStatus(@Param("id")int id,@Param("payStatus")String payStatus,@Param("payTime")String payTime,@Param("payStyle")String payStyle);
	
	/**
	 * �����ջ�״̬
	 * @param orderId	����id
	 * @param receiveStatus	�ջ�״̬
	 */
	public void updateReceiveStatus(@Param("id")int id,@Param("receiveStatus")int receiveStatus);
	
	/**
	 * ���¶���״̬
	 * @param orderId	����id
	 * @param orderStatus	�ջ�״̬
	 */
	public void updateOrderStatus(@Param("id")int id,@Param("orderStatus")String orderStatus);
	
	/**
	 * ��������״̬
	 * @param orderId	����id
	 * @param deliverTime	����ʱ��
	 * @param shipName	�������
	 * @param shipOrderNumber	��ݵ���
	 */
	public void updateShipStatus(@Param("orderStatus")String orderStatus,@Param("id")int id,@Param("deliverTime")String deliverTime,@Param("shipName")String shipName,@Param("shipOrderNumber")String shipOrderNumber);
	
	/**
	 * ���¶���
	 * @param orderId
	 * @param order	����
	 */
	public void updateOrder(@Param("id")int id,@Param("order")Order order);
}
