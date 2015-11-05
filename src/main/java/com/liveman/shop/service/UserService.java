package com.liveman.shop.service;

import com.liveman.shop.entity.user.User;
import com.liveman.shop.global.ReturnStatus;

public interface UserService {

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	ReturnStatus register(User user);

	/**
	 * 登陆
	 * 
	 * @param email
	 * @param password
	 * @return 成功返回User对象；失败返回null，失败必定是"用户名或者密码不正确！"
	 */
	ReturnStatus login(String email, String password);

	/**
	 * 检查重置密码的链接是否有效(是否存在uuid，uuid是否超时)
	 * 
	 * @param email
	 * @return
	 */
	ReturnStatus checkResetPasswordLink(String uuid);

	/**
	 * 重置密码
	 * 
	 * @param email
	 * @return 成功返回1，并给email发生链接链接；失败返回失败信息
	 */
	ReturnStatus resetPassword(String email);

	/**
	 * 重置密码用户修改密码
	 * 
	 * @param uuid
	 * @param newPassword
	 * @return
	 */
	ReturnStatus resetPassword(String uuid, String newPassword);

	/**
	 * 正常用户修改密码
	 * 
	 * @param userId
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	ReturnStatus changePassword(int userId, String oldPwd, String newPwd);

	/**
	 * 禁用账户
	 * 
	 * @param userId
	 * @return
	 */
	ReturnStatus disableUser(int userId);

	/**
	 * 验证用户名是否重复
	 * 
	 * @param userId
	 * @param alias
	 * @return
	 */
	ReturnStatus checkUsername(Integer usertId, String alias);

	/**
	 * 验证邮箱是否重复
	 * 
	 * @param userId
	 * @param alias
	 * @return
	 */
	ReturnStatus checkEmail(Integer usertId, String email);

	/**
	 * 验证手机是否重复
	 * 
	 * @param userId
	 * @param alias
	 * @return
	 */
	ReturnStatus checkPhone(Integer usertId, String phone);

	/**
	 * 更新用户信息
	 * 
	 * @param user
	 * @return
	 */
	ReturnStatus edit(User user);

	/**
	 * 根据userId获取user信息
	 * 
	 * @param userId
	 * @return
	 */
	User get(int userId);
}