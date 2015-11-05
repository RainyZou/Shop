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
* @Description: �����Ϣ��ѯ
* @author sunny
* @date 2015��11��3��
* @version V1.0
 */
@Component("expressService")
public class ExpressServiceImpl implements ExpressService{
	
	/**
	 * �ô����ں��ڿ�������ϸ�������������������͸�����ϸ����״̬��Ŀǰֻ���򵥷���
	 */
	@Override
	public Express expressDetail(String order, String express) {
		Express data = ExpressTool.checkExpress(order, ExpressEnum.valueOf(express.toUpperCase()));
		return data;
	}

}
