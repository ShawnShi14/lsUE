package org.loushang.ue.organ.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.loushang.framework.util.UUIDGenerator;
import org.loushang.ue.organ.data.Organ;
import org.loushang.ue.organ.service.IOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/organ")
public class OrgController {

	@Autowired
	IOrgService orgService;

	// 初始化所有的节点
	@RequestMapping(value = "/getAllNodes", method = RequestMethod.GET)
	@ResponseBody
	public List<Organ> findAllNodes(HttpServletRequest request) {
		String parentId = request.getParameter("id");
		List<Organ> organ = new ArrayList<Organ>();
		organ = orgService.findAllNodes(parentId);
		return organ;
	}

	// 增加节点
	@RequestMapping(value = "/addNode", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> addNode(HttpServletRequest request){
		Map<String,String> orgmap = new HashMap<String, String>();
		String name = request.getParameter("name");
		String parentId = request.getParameter("parentId");
		String id = UUIDGenerator.getUUID();
		String flag = "false";
		// 取isParent值，判断是不是true
		String isParent = orgService.findById(parentId).getIsParent();
		if (isParent == "1") {
			orgService.addNode(id, name, parentId);
		} else {
			orgService.addNode(id, name, parentId);
			orgService.updateIsParentT(parentId);
		}
		String strName = orgService.findById(id).getName();
		if(name.equals(strName)){
			flag = "true";
			orgmap.put("flag", flag);
			orgmap.put("id", id);
		}
		return orgmap;
	}

	// 修改节点信息
	@RequestMapping(value = "/updateNode", method = RequestMethod.POST)
	@ResponseBody
	public String updateNode(HttpServletRequest request) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String orgName = orgService.findById(id).getName();
		if (orgName != name) {
			orgService.updateNode(id, name);
		}
		String flag = "false";
		String orgName1 = orgService.findById(id).getName();
		if ((name).equals(orgName1) == true) {
			flag = "true";
		}
		return flag;
	}

	// 删除节点之前判断是不是父节点
	@RequestMapping(value = "/findChildrenNodes", method = RequestMethod.GET)
	@ResponseBody
	public String findChildrenNodes(HttpServletRequest request) {
		String parentId = request.getParameter("id");
		String flag = "false";
		List<Organ> orgObj = new ArrayList<Organ>();
		orgObj = orgService.findAllNodes(parentId);
		if (orgObj.size() != 0) {
			flag = "true";
		}
		return flag;
	}

	// 删除节点
	@RequestMapping(value = "/deleteNode", method = RequestMethod.POST)
	@ResponseBody
	public String deleteNode(HttpServletRequest request) {
		String id = request.getParameter("id");
		String parentId = request.getParameter("parentId");
		String flag = "false";
		orgService.deleteNode(id);
		// 判断父节点删除子节点后是不是空
		List<Organ> organObj = new ArrayList<Organ>();
		organObj = orgService.findAllNodes(parentId);
		if (organObj.size() == 0) {
			// 如果父节点没有子节点，设置isParent字段为false
			orgService.updateIsParentF(parentId);
		}
		Organ organ = orgService.findById(id);
		if (organ == null) {
			flag = "true";
		}
		return flag;
	}
}
