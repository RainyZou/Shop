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
			return new ReturnStatus(-1, "�û����Ѵ��ڣ�");
		}

		ue = new UserExample();
		ue.createCriteria().andEmailEqualTo(user.getEmail());
		list = userMapper.selectByExample(ue);
		if (!list.isEmpty()) {
			return new ReturnStatus(-1, "�����ַ�Ѵ��ڣ�");
		}

		user.setStatus("yes");
		int result = userMapper.insert(user);
		if (result == 1) {
			ShopMail.sendRegisterSuccess(user.getUsername(), user.getEmail());
			return new ReturnStatus(1, "ע��ɹ���");
		} else {
			return new ReturnStatus(-1, "ע��ʧ�ܣ�");
		}
	}

	@Override
	public ReturnStatus login(String email, String password) {
		UserExample ue = new UserExample();
		ue.createCriteria().andEmailEqualTo(email).andPasswordEqualTo(password);

		List<User> list = userMapper.selectByExample(ue);
		if (!list.isEmpty()) {
			return new ReturnStatus(1, "��½�ɹ���", list.get(0));
		} else {
			return new ReturnStatus(-1, "�û����������벻��ȷ��");
		}
	}

	@Override
	public ReturnStatus checkResetPasswordLink(String uuid) {
		// ������������Ƿ���Ȼ��Ч(�Ƿ����uuid��uuid�Ƿ�ʱ)
		ResetPasswordExample example = new ResetPasswordExample();
		example.createCriteria().andUuidEqualTo(uuid);
		List<ResetPassword> listResetPwd = resetPasswordMapper.selectByExample(example);
		if (listResetPwd.isEmpty()) {
			return new ReturnStatus(-1, "������������ʧЧ���������������ã�");
		} else {
			ResetPassword rp = listResetPwd.get(0);
			String time = rp.getApplyTime();
			LocalDateTime localTime1 = LocalDateTime.parse(time.substring(0, 19).replace(" ", "T"));
			LocalDateTime localTime2 = LocalDateTime.now();
			long until = localTime1.until(localTime2, ChronoUnit.MINUTES);
			if (until > 120) {
				return new ReturnStatus(-1, "�����������ӳ�ʱ���������������ã�");
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
				return new ReturnStatus(1, "���óɹ������������ʼ��������ղ��������", uuid);
			} else {
				return new ReturnStatus(-1, "����ʧ�ܣ������ԣ�");
			}
		} else {
			return new ReturnStatus(-1, "�����ַδע�ᣡ");
		}
	}

	@Override
	public ReturnStatus resetPassword(String uuid, String newPassword) {
		// ������������Ƿ���Ȼ��Ч(�Ƿ����uuid��uuid�Ƿ�ʱ)
		ReturnStatus rs = checkResetPasswordLink(uuid);
		if (rs.getCode() != 1) {
			return rs;
		}
		ResetPassword resetPassword = (ResetPassword) rs.getUserData();

		// ���email��ַ�Ƿ���ȷ����ȷ���޸�����
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

				return new ReturnStatus(1, "�޸�����ɹ���");
			} else {
				return new ReturnStatus(-1, "�޸�����ʧ�ܣ������ԣ�");
			}
		} else {
			return new ReturnStatus(-1, "�����ַ�����ڣ�");
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
				return new ReturnStatus(1, "�޸�����ɹ���");
			} else {
				return new ReturnStatus(-1, "�޸�����ʧ�ܣ������ԣ�");
			}
		} else {
			return new ReturnStatus(-1, "ԭʼ���벻��ȷ��");
		}
	}

	@Override
	public ReturnStatus disableUser(int userId) {
		User user = new User();
		user.setId(userId);
		user.setStatus("����");

		int result = userMapper.updateByPrimaryKeySelective(user);

		if (result == 1) {
			return new ReturnStatus(1, "���óɹ���");
		} else {
			return new ReturnStatus(-1, "����ʧ�ܣ������ԣ�");
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
			return new ReturnStatus(-1, "�û����Ѿ�����");
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
			return new ReturnStatus(-1, "�����Ѿ�����");
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
			return new ReturnStatus(-1, "�ֻ����Ѿ�����");
		}
	}

	@Override
	public ReturnStatus edit(User user) {
		if (user == null || user.getId() <= 0) {
			return new ReturnStatus(-1, "�û������ڣ�");
		}

		int result = userMapper.updateByPrimaryKeySelective(user);
		if (result == 1) {
			return new ReturnStatus(1, "�û���Ϣ�Ѿ����£�");
		} else {
			return new ReturnStatus(-1, "������Ϣʧ�ܣ������ԣ�");
		}
	}

	@Override
	public User get(int userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

}