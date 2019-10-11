package org.loushang.ue.com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.loushang.ue.com.data.Component;
import org.loushang.ue.com.service.IComService;
import org.loushang.ue.comtype.data.ComType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/com")
public class ComController {

	@Autowired
	private IComService comService;

	// 初始化页面
	@RequestMapping(value = "/getAllComs")
	@ResponseBody
	public Map<String, Object> getAllComs() {
		Map<String, Object> uedata = new HashMap<String, Object>();
		List<Component> components = new ArrayList<Component>();
		components = comService.getAllComs();
		uedata.put("data", components);
		return uedata;
	}

	// 按组件分类加载页面
	@RequestMapping(value = "/getComsByTypeId", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getComsByTypeId(HttpServletRequest request) {
		String typeId = request.getParameter("typeId");
		Map<String, Object> uedata = new HashMap<String, Object>();
		List<ComType> components = new ArrayList<ComType>();
		components = comService.getComsByTypeId(typeId);
		uedata.put("data", components);
		return uedata;
	}

	// 按组件名称进行模糊查询
	@RequestMapping(value = "/getComsByName")
	@ResponseBody
	public Map<String, Object> getComsByName(@RequestParam("name") String name) {
		Map<String, Object> uedata = new HashMap<String, Object>();
		List<Component> components = comService.getComsByName(name);
		uedata.put("data", components);
		return uedata;
	}

	// 按组件id对组件进行查询
	@RequestMapping(value = "/getComsByComponentId", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findComponentById(HttpServletRequest request) {
		String comId = request.getParameter("comId");
		Map<String, Object> uedata = new HashMap<String, Object>();
		Component components = new Component();
		components = comService.getComsByComponentId(comId);
		uedata.put("data", components);
		return uedata;
	}

	// 按最新发布时间推荐组件
	@RequestMapping(value = "/getComsOrderByCreateTime")
	@ResponseBody
	public Map<String, Object> getComsOrderByCreateTime(HttpServletRequest request) {
		String typeId = request.getParameter("typeId");
		Map<String, Object> uedata = new HashMap<String, Object>();
		List<Component> components = new ArrayList<Component>();
		components = comService.getComsOrderByCreateTime(typeId);
		uedata.put("data", components);
		return uedata;
	}

	// 更新浏览次数
	@RequestMapping(value = "/updateViewCount", method = RequestMethod.POST)
	@ResponseBody
	public void updateViewCount(HttpServletRequest request) {
		String id = request.getParameter("comId");
		Component component = new Component();
		component.setId(id);
		comService.updateViewCount(component);
	}

	// 按最多浏览次数推荐组件
	@RequestMapping(value = "/getComsOrderByViewCounts")
	@ResponseBody
	public Map<String, Object> getComsOrderByViewCounts(HttpServletRequest request) {
		String typeId = request.getParameter("typeId");
		Map<String, Object> uedata = new HashMap<String, Object>();
		List<Component> components = new ArrayList<Component>();
		components = comService.getComsOrderByViewCounts(typeId);
		uedata.put("data", components);
		return uedata;
	}

	// 组件分类情况下按下载次数进行排序
	@RequestMapping(value = "/getComsOrderByDownloadCounts", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getComsOrderByDownloadCountsType(HttpServletRequest request) {
		String typeId = request.getParameter("typeId");
		Map<String, Object> uedata = new HashMap<String, Object>();
		List<Component> components = new ArrayList<Component>();
		components = comService.getComsOrderByDownloadCounts(typeId);
		uedata.put("data", components);
		return uedata;
	}

	// 按照组件评论数降序排列
	@RequestMapping(value = "/getComsOrderByCommentCounts")
	@ResponseBody
	public Map<String, Object> getComsOrderByCommentCounts(HttpServletRequest request) {
		String typeId = request.getParameter("typeId");
		Map<String, Object> uedata = new HashMap<String, Object>();
		List<Component> components = new ArrayList<Component>();
		components = comService.getComsOrderByCommentCounts(typeId);
		uedata.put("data", components);
		return uedata;
	}

	// 统计并修改组件评论数
	@RequestMapping(value = "/updateFeedBackCounts", method = RequestMethod.POST)
	@ResponseBody
	public void updateFeedBackCounts(HttpServletRequest request) {
		String id = request.getParameter("comId");
		Integer feedbackCount = Integer.parseInt(request.getParameter("count"));
		Component component = new Component();
		component.setId(id);
		component.setFeedbackCount(feedbackCount);
		comService.updateFeedBackCounts(component);
	}

}
