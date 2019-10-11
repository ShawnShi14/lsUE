package org.loushang.ue.echarts.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/echarts")
public class EchartsController {
	
	//柱状图
	@RequestMapping(value = "/bar")
	@ResponseBody
	public Map<String, Object> getBarDatas() {
		Map<String, Object> result = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < 12; i++) {
            Map<String, Object> item = new HashMap<String, Object>();
            item.put("month", (i + 1) + "月");
            item.put("volume1", (int) (Math.random() * 1000));
            item.put("volume2", (int) (Math.random() * 1000));
            list.add(item);
        }
        result.put("data", list);
        result.put("total", list.size());
        result.put("msg", "success");
        return result;
	}
	
	//折线图
	@RequestMapping(value = "/line")
	@ResponseBody
	public Map<String, Object> getLineDatas() {
		Map<String, Object> result = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < 12; i++) {
            Map<String, Object> item = new HashMap<String, Object>();
            item.put("month", (i + 1) + "月");
            item.put("volume1", (int) (Math.random() * 1000));
            item.put("volume2", (int) (Math.random() * 1000));
            list.add(item);
        }
        result.put("data", list);
        result.put("total", list.size());
        result.put("msg", "success");
        return result;
	}
	
	//饼图
	@RequestMapping(value = "/pie")
	@ResponseBody
	public Map<String, Object> getPieDatas() {
		String[] DATA_NAMES = { "直接流量", "付费搜索", "自然搜索", "电子邮件", "引荐", "社交网络", "展示广告" };
		Map<String, Object> result = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < DATA_NAMES.length; i++) {
            Map<String, Object> item = new HashMap<String, Object>();
            item.put("id", (i + 1));
            item.put("name", DATA_NAMES[i]);
            item.put("volume", (int) (Math.random() * 1000));
            list.add(item);
        }
        result.put("data", list);
        result.put("total", list.size());
        result.put("msg", "success");
        return result;
	}
	
	//饼图
	@RequestMapping(value = "/map")
	@ResponseBody
	public Map<String, Object> getMapDatas() {
		String[] DATA_NAMES = { "北京", "天津", "上海", "山东", "河北", "河南", "辽宁", "黑龙江", "湖南", "安徽" };
		Map<String, Object> result = new HashMap<String, Object>();
	    List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	    for (int i = 0; i < DATA_NAMES.length; i++) {
	        Map<String, Object> item = new HashMap<String, Object>();
	        item.put("id", (i + 1));
	        item.put("area", DATA_NAMES[i]);
	        item.put("uv", (int)(Math.random() * 1000));
	        list.add(item);
	    }
	    result.put("data", list);
	    result.put("total", list.size());
	    result.put("msg", "success");
	    return result;
	}
}
