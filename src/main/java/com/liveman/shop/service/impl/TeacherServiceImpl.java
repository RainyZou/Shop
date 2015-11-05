package com.liveman.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liveman.shop.dao.TeacherDao;
import com.liveman.shop.entity.Teacher;
import com.liveman.shop.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	TeacherDao teacherDao;

	@Override
	public Teacher getTeacherById(int id) {

		return teacherDao.getById(id);
	}

}
