package com.liveman.shop.service.impl;

import org.springframework.stereotype.Component;

import com.liveman.shop.express.Express;
import com.liveman.shop.express.ExpressEnum;
import com.liveman.shop.express.ExpressTool;
import com.liveman.shop.service.ExpressService;

/**
 * 
* @Title: ExpressServiceImpl.java
* @Package com.liveman.shop.service.impl
* @Description: 快递信息查询
* @author sunny
* @date 2015年11月3日
* @version V1.0
 */
@Component("expressService")
public class ExpressServiceImpl implements ExpressService{
	
	/**
	 * 该处理在后期可以做详细处理，比如碰到错误代码和给出详细单号状态，目前只做简单返回
	 */
	@Override
	public Express expressDetail(String order, String express) {
		Express data = ExpressTool.checkExpress(order, ExpressEnum.valueOf(express.toUpperCase()));
		return data;
	}

}
