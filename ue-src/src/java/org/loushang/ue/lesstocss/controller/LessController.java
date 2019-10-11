package org.loushang.ue.lesstocss.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.loushang.ue.lesstocss.service.ILessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/less")
public class LessController {
	
	@Autowired
	ILessService lessService;
	
	//初始化页面
	@RequestMapping(value = "/createCss")
	@ResponseBody
	public void createCss(HttpServletRequest request) throws UnsupportedEncodingException {
		String content = new String(request.getParameter("content").getBytes("iso-8859-1"),"utf-8");
		lessService.createCss(content);
	}
}
