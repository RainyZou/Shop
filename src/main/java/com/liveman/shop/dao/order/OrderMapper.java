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
* @Description: 订单dao层操作
* @author sunny
* @date 2015年10月22日
* @version V1.0
 */
public interface OrderMapper {
	
	/**
	 * 插入订单
	 * @param 订单
	 */
	public void insertOrder(Order order);
	
	/**
	 * 插入订单详情
	 * @param details 订单详情
	 */
	public void insertOrderDetail(List<OrderDetail> details);
	
	/**
	 * 通过userId查询所有订单
	 * @param userId  用户id
	 * @return  orderVO list用来View层展示
	 */
	public List<OrderVO> selectAllOrders(int userId);
	
	/**
	 * 通过订单id查询
	 * @param orderId  订单id
	 * @return orderVO
	 */
	public OrderVO selectOrderById(int orderId);
	
	/**
	 * 通过支付状态查询
	 * @param userId	用户id
	 * @param payStatus	支付状态
	 * @return	orderVO list用来View层展示
	 */
	public List<OrderVO> selectOrdersByPayStatus(@Param("userId")int userId,@Param("payStatus")String payStatus);
	
	/**
	 * 通过订单状态查询
	 * @param userId 用户id
	 * @param orderStatus	订单状态
	 * @return
	 */
	public List<OrderVO> selectOrdersByOrderStatus(@Param("userId")int userId,@Param("orderStatus")String orderStatus);
	
	/**
	 * 通过订单状态查询
	 * @param userId 用户id
	 * @return
	 */
	public List<OrderVO> selectOrdersByCancelStatus(@Param("userId")int userId);
	
	/**
	 * 通过收货状态查询
	 * @param userId	用户id
	 * @param receiveStatus	收货状态
	 * @return
	 */
	public List<OrderVO> selectOrdersByReceiveStatus(@Param("userId")int userId,@Param("receiveStatus")int receiveStatus);
	
	/**
	 * 查询未评论的订单
	 * @param userId
	 * @return
	 */
	public List<OrderVO> selectOrdersByEvaluation(@Param("userId")int userId);
	
	/**
	 * 更新评论
	 * @param orderId	订单id
	 * @param evaluationId	评论id
	 */
	public void updateEvaluation(@Param("id")int id,@Param("evaluationId")int evaluationId);
	
	/**
	 * 更新支付状态和时间
	 * @param orderId	订单id
	 * @param payStatus	支付状态
	 * @param payTime	支付时间
	 */
	public void updatePayStatus(@Param("id")int id,@Param("payStatus")String payStatus,@Param("payTime")String payTime,@Param("payStyle")String payStyle);
	
	/**
	 * 更新收货状态
	 * @param orderId	订单id
	 * @param receiveStatus	收货状态
	 */
	public void updateReceiveStatus(@Param("id")int id,@Param("receiveStatus")int receiveStatus);
	
	/**
	 * 更新订单状态
	 * @param orderId	订单id
	 * @param orderStatus	收货状态
	 */
	public void updateOrderStatus(@Param("id")int id,@Param("orderStatus")String orderStatus);
	
	/**
	 * 更新物流状态
	 * @param orderId	订单id
	 * @param deliverTime	发货时间
	 * @param shipName	快递名称
	 * @param shipOrderNumber	快递单号
	 */
	public void updateShipStatus(@Param("orderStatus")String orderStatus,@Param("id")int id,@Param("deliverTime")String deliverTime,@Param("shipName")String shipName,@Param("shipOrderNumber")String shipOrderNumber);
	
	/**
	 * 更新订单
	 * @param orderId
	 * @param order	订单
	 */
	public void updateOrder(@Param("id")int id,@Param("order")Order order);
}
