package com.liveman.shop.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.liveman.shop.entity.Teacher;
import com.liveman.shop.service.TeacherService;

@Controller
@RequestMapping("/Teacher")
public class TeacherController {

	@Resource
	TeacherService teacherService;

	@RequestMapping("getTeacher")
	public ModelAndView getTeacher(int id) {

		Teacher t = teacherService.getTeacherById(id);
		ModelAndView mv = new ModelAndView("/teacher");

		mv.addObject("teacher", t);

		return mv;

	}

}
