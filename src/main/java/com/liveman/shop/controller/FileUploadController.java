package com.liveman.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baidu.ueditor.ActionEnter;

@Controller
@RequestMapping(value = "fileUpload")
public class FileUploadController {

	@RequestMapping(value = "upload")
	public void uploadFile(HttpServletRequest request, HttpServletResponse response) {
		response.setHeader("Content-Type", "text/html");
		String rootPath = request.getSession().getServletContext().getRealPath("/");

		try {
			String exec = new ActionEnter(request, rootPath).exec();
			PrintWriter writer = response.getWriter();
			writer.write(exec);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
