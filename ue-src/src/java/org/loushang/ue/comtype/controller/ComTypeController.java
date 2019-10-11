package org.loushang.ue.comtype.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.loushang.ue.comtype.data.ComType;
import org.loushang.ue.comtype.service.Impl.IComTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/comtype")
public class ComTypeController {

	@Autowired
	IComTypeService comTypeService;

	// 初始化一级导航栏
	@RequestMapping(value = "/getTopType", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getTopType() {
		Map<String, Object> uedata = new HashMap<String, Object>();
		List<ComType> comptype = new ArrayList<ComType>();
		comptype = comTypeService.getTopType();
		uedata.put("data", comptype);
		return uedata;
	}

	// 初始化二级导航栏
	@RequestMapping(value = "/getSubType", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getSubType(HttpServletRequest request) {
		String parentId = request.getParameter("parentId");
		Map<String, Object> uedata = new HashMap<String, Object>();
		List<ComType> comptype = new ArrayList<ComType>();
		comptype = comTypeService.getSubType(parentId);
		uedata.put("data", comptype);
		return uedata;
	}

}
