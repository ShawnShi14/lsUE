package org.loushang.ue.com.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.loushang.ue.com.dao.ComMapper;
import org.loushang.ue.com.data.Component;
import org.loushang.ue.com.service.IComService;
import org.loushang.ue.comtype.data.ComType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComServiceImpl implements IComService {

	@Autowired
	private ComMapper comMapper;

	@Override
	public List<Component> getAllComs() {
		return comMapper.getAllComs();
	}

	@Override
	public List<ComType> getComsByTypeId(String typeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("typeId", typeId);
		return comMapper.getComsByTypeId(map);
	}

	@Override
	public List<Component> getComsByName(String name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		return comMapper.getComsByName(map);
	}

	@Override
	public Component getComsByComponentId(String comId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", comId);
		return comMapper.getComsByComponentId(map);
	}

	@Override
	public List<Component> getComsOrderByDownloadCounts(String typeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("typeId", typeId);
		return comMapper.getComsOrderByDownloadCounts(map);
	}

	/**
	 * 根据评论次数排序
	 */
	@Override
	public List<Component> getComsOrderByCommentCounts(String typeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("typeId", typeId);
		return comMapper.getComsOrderByCommentCounts(map);
	}

	@Override
	public List<Component> getComsOrderByCreateTime(String typeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("typeId", typeId);
		return comMapper.getComsOrderByCreateTime(map);
	}

	/**
	 * 根据浏览次数进行排序
	 * 
	 * @return
	 */
	@Override
	public List<Component> getComsOrderByViewCounts(String typeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("typeId", typeId);
		return comMapper.getComsOrderByViewCounts(map);
	}

	@Override
	public void updateViewCount(Component component) {
		comMapper.updateViewCount(component);

	}

	@Override
	public void updateFeedBackCounts(Component component) {
		comMapper.updateFeedBackCounts(component);
	}

}
