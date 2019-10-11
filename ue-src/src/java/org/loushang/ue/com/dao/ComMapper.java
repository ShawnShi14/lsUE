package org.loushang.ue.com.dao;

import java.util.List;
import java.util.Map;

import org.loushang.ue.com.data.Component;
import org.loushang.ue.comtype.data.ComType;

public interface ComMapper {

	public List<Component> getAllComs();

	public List<ComType> getComsByTypeId(Map<String, Object> map);

	public List<Component> getComsByName(Map<String, Object> map);

	public Component getComsByComponentId(Map<String, Object> map);

	// 根据创建时间进行排序
	public List<Component> getComsOrderByCreateTime(Map<String, Object> map);

	// 根据浏览次数进行排序
	public List<Component> getComsOrderByViewCounts(Map<String, Object> map);

	public void updateViewCount(Component component);

	// 根据评论进行排序
	public List<Component> getComsOrderByCommentCounts(Map<String, Object> map);

	public void updateFeedBackCounts(Component component);

	public List<Component> getComsOrderByDownloadCounts(Map<String, Object> map);

}
