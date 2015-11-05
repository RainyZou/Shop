package com.liveman.shop.service.impl;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liveman.shop.dao.user.ResetPasswordMapper;
import com.liveman.shop.dao.user.UserMapper;
import com.liveman.shop.entity.user.ResetPassword;
import com.liveman.shop.entity.user.ResetPasswordExample;
import com.liveman.shop.entity.user.User;
import com.liveman.shop.entity.user.UserExample;
import com.liveman.shop.global.DateTool;
import com.liveman.shop.global.ReturnStatus;
import com.liveman.shop.global.ShopMail;
import com.liveman.shop.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	@Autowired
	ResetPasswordMapper resetPasswordMapper;

	@Override
	public ReturnStatus register(User user) {
		UserExample ue = new UserExample();
		ue.createCriteria().andUsernameEqualTo(user.getUsername());
		List<User> list = userMapper.selectByExample(ue);
		if (!list.isEmpty()) {
			return new ReturnStatus(-1, "用户名已存在！");
		}

		ue = new UserExample();
		ue.createCriteria().andEmailEqualTo(user.getEmail());
		list = userMapper.selectByExample(ue);
		if (!list.isEmpty()) {
			return new ReturnStatus(-1, "邮箱地址已存在！");
		}

		user.setStatus("yes");
		int result = userMapper.insert(user);
		if (result == 1) {
			ShopMail.sendRegisterSuccess(user.getUsername(), user.getEmail());
			return new ReturnStatus(1, "注册成功！");
		} else {
			return new ReturnStatus(-1, "注册失败！");
		}
	}

	@Override
	public ReturnStatus login(String email, String password) {
		UserExample ue = new UserExample();
		ue.createCriteria().andEmailEqualTo(email).andPasswordEqualTo(password);

		List<User> list = userMapper.selectByExample(ue);
		if (!list.isEmpty()) {
			return new ReturnStatus(1, "登陆成功！", list.get(0));
		} else {
			return new ReturnStatus(-1, "用户名或者密码不正确！");
		}
	}

	@Override
	public ReturnStatus checkResetPasswordLink(String uuid) {
		// 检测重置链接是否依然有效(是否存在uuid，uuid是否超时)
		ResetPasswordExample example = new ResetPasswordExample();
		example.createCriteria().andUuidEqualTo(uuid);
		List<ResetPassword> listResetPwd = resetPasswordMapper.selectByExample(example);
		if (listResetPwd.isEmpty()) {
			return new ReturnStatus(-1, "密码重置链接失效，请重新申请重置！");
		} else {
			ResetPassword rp = listResetPwd.get(0);
			String time = rp.getApplyTime();
			LocalDateTime localTime1 = LocalDateTime.parse(time.substring(0, 19).replace(" ", "T"));
			LocalDateTime localTime2 = LocalDateTime.now();
			long until = localTime1.until(localTime2, ChronoUnit.MINUTES);
			if (until > 120) {
				return new ReturnStatus(-1, "密码重置链接超时，请重新申请重置！");
			}
		}
		return new ReturnStatus(1, "", listResetPwd.get(0));
	}

	@Override
	public ReturnStatus resetPassword(String email) {
		UserExample ue = new UserExample();
		ue.createCriteria().andEmailEqualTo(email);
		List<User> list = userMapper.selectByExample(ue);

		if (!list.isEmpty()) {
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			ResetPassword rp = new ResetPassword();
			rp.setUuid(uuid);
			rp.setEmail(email);
			rp.setApplyTime(DateTool.getCurrentTimeCN());

			int result = resetPasswordMapper.insert(rp);
			if (result == 1) {
				ShopMail.sendResetLink(uuid, email);
				return new ReturnStatus(1, "重置成功！请您查收邮件，并按照步骤操作！", uuid);
			} else {
				return new ReturnStatus(-1, "重置失败，请重试！");
			}
		} else {
			return new ReturnStatus(-1, "邮箱地址未注册！");
		}
	}

	@Override
	public ReturnStatus resetPassword(String uuid, String newPassword) {
		// 检测重置链接是否依然有效(是否存在uuid，uuid是否超时)
		ReturnStatus rs = checkResetPasswordLink(uuid);
		if (rs.getCode() != 1) {
			return rs;
		}
		ResetPassword resetPassword = (ResetPassword) rs.getUserData();

		// 检查email地址是否正确，正确就修改密码
		UserExample ue = new UserExample();
		ue.createCriteria().andEmailEqualTo(resetPassword.getEmail());
		List<User> list = userMapper.selectByExample(ue);
		if (!list.isEmpty()) {
			User user = new User();
			user.setId(list.get(0).getId());
			user.setPassword(newPassword);

			int result = userMapper.updateByPrimaryKeySelective(user);
			if (result == 1) {
				resetPasswordMapper.deleteByPrimaryKey(resetPassword.getId());

				return new ReturnStatus(1, "修改密码成功！");
			} else {
				return new ReturnStatus(-1, "修改密码失败，请重试！");
			}
		} else {
			return new ReturnStatus(-1, "邮箱地址不存在！");
		}
	}

	@Override
	public ReturnStatus changePassword(int userId, String oldPwd, String newPwd) {
		UserExample ue = new UserExample();
		ue.createCriteria().andIdEqualTo(userId).andPasswordEqualTo(oldPwd);

		List<User> list = userMapper.selectByExample(ue);
		if (!list.isEmpty()) {
			User user = new User();
			user.setId(userId);
			user.setPassword(newPwd);

			int result = userMapper.updateByPrimaryKeySelective(user);
			if (result == 1) {
				return new ReturnStatus(1, "修改密码成功！");
			} else {
				return new ReturnStatus(-1, "修改密码失败，请重试！");
			}
		} else {
			return new ReturnStatus(-1, "原始密码不正确！");
		}
	}

	@Override
	public ReturnStatus disableUser(int userId) {
		User user = new User();
		user.setId(userId);
		user.setStatus("禁用");

		int result = userMapper.updateByPrimaryKeySelective(user);

		if (result == 1) {
			return new ReturnStatus(1, "禁用成功！");
		} else {
			return new ReturnStatus(-1, "禁用失败，请重试！");
		}
	}

	@Override
	public ReturnStatus checkUsername(Integer usertId, String username) {
		UserExample ue = new UserExample();
		UserExample.Criteria c = ue.createCriteria();
		c.andUsernameEqualTo(username);
		if (usertId != null) {
			c.andIdNotEqualTo(usertId);
		}

		List<User> list = userMapper.selectByExample(ue);
		if (list.isEmpty()) {
			return new ReturnStatus(1);
		} else {
			return new ReturnStatus(-1, "用户名已经存在");
		}
	}

	@Override
	public ReturnStatus checkEmail(Integer usertId, String email) {
		UserExample ue = new UserExample();
		UserExample.Criteria c = ue.createCriteria();
		c.andEmailEqualTo(email);
		if (usertId != null) {
			c.andIdNotEqualTo(usertId);
		}

		List<User> list = userMapper.selectByExample(ue);
		if (list.isEmpty()) {
			return new ReturnStatus(1);
		} else {
			return new ReturnStatus(-1, "邮箱已经存在");
		}
	}

	@Override
	public ReturnStatus checkPhone(Integer usertId, String phone) {
		UserExample ue = new UserExample();
		UserExample.Criteria c = ue.createCriteria();
		c.andPhoneEqualTo(phone);
		if (usertId != null) {
			c.andIdNotEqualTo(usertId);
		}

		List<User> list = userMapper.selectByExample(ue);
		if (list.isEmpty()) {
			return new ReturnStatus(1);
		} else {
			return new ReturnStatus(-1, "手机号已经存在");
		}
	}

	@Override
	public ReturnStatus edit(User user) {
		if (user == null || user.getId() <= 0) {
			return new ReturnStatus(-1, "用户不存在！");
		}

		int result = userMapper.updateByPrimaryKeySelective(user);
		if (result == 1) {
			return new ReturnStatus(1, "用户信息已经更新！");
		} else {
			return new ReturnStatus(-1, "更新信息失败，请重试！");
		}
	}

	@Override
	public User get(int userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

}