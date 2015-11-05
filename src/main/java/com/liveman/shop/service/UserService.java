package com.liveman.shop.service;

import com.liveman.shop.entity.user.User;
import com.liveman.shop.global.ReturnStatus;

public interface UserService {

	/**
	 * �û�ע��
	 * 
	 * @param user
	 * @return
	 */
	ReturnStatus register(User user);

	/**
	 * ��½
	 * 
	 * @param email
	 * @param password
	 * @return �ɹ�����User����ʧ�ܷ���null��ʧ�ܱض���"�û����������벻��ȷ��"
	 */
	ReturnStatus login(String email, String password);

	/**
	 * �����������������Ƿ���Ч(�Ƿ����uuid��uuid�Ƿ�ʱ)
	 * 
	 * @param email
	 * @return
	 */
	ReturnStatus checkResetPasswordLink(String uuid);

	/**
	 * ��������
	 * 
	 * @param email
	 * @return �ɹ�����1������email�����������ӣ�ʧ�ܷ���ʧ����Ϣ
	 */
	ReturnStatus resetPassword(String email);

	/**
	 * ���������û��޸�����
	 * 
	 * @param uuid
	 * @param newPassword
	 * @return
	 */
	ReturnStatus resetPassword(String uuid, String newPassword);

	/**
	 * �����û��޸�����
	 * 
	 * @param userId
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	ReturnStatus changePassword(int userId, String oldPwd, String newPwd);

	/**
	 * �����˻�
	 * 
	 * @param userId
	 * @return
	 */
	ReturnStatus disableUser(int userId);

	/**
	 * ��֤�û����Ƿ��ظ�
	 * 
	 * @param userId
	 * @param alias
	 * @return
	 */
	ReturnStatus checkUsername(Integer usertId, String alias);

	/**
	 * ��֤�����Ƿ��ظ�
	 * 
	 * @param userId
	 * @param alias
	 * @return
	 */
	ReturnStatus checkEmail(Integer usertId, String email);

	/**
	 * ��֤�ֻ��Ƿ��ظ�
	 * 
	 * @param userId
	 * @param alias
	 * @return
	 */
	ReturnStatus checkPhone(Integer usertId, String phone);

	/**
	 * �����û���Ϣ
	 * 
	 * @param user
	 * @return
	 */
	ReturnStatus edit(User user);

	/**
	 * ����userId��ȡuser��Ϣ
	 * 
	 * @param userId
	 * @return
	 */
	User get(int userId);
}