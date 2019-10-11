package org.loushang.ue.cant.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.loushang.ue.cant.data.Cant;
import org.loushang.ue.cant.service.ICantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/bsp/cant")
public class CantController {

	@Autowired
	private ICantService cantService;

	@RequestMapping("/getChild")
	@ResponseBody
	public Map<String, Object> getCantBySuperCode(@RequestParam("code") String code) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			List<Cant> list = cantService.getCantBySuperCode(code);
			result.put("message", "success");
			result.put("data", list);
			result.put("code", HttpStatus.OK);
		} catch (Exception e) {
			result.put("message", "error");
			result.put("data", Collections.EMPTY_LIST);
			result.put("code", HttpStatus.valueOf(500));
		}
		return result;
	}
}
