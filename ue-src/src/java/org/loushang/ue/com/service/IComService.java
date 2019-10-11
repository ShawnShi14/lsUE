package org.loushang.ue.com.service;

import java.util.List;

import org.loushang.ue.com.data.Component;
import org.loushang.ue.comtype.data.ComType;

public interface IComService {

	/**
	 * 初始化页面
	 * 
	 * @return
	 */

	public List<Component> getAllComs();

	/**
	 * 根据组件类别ID获取组件信息
	 * 
	 * @param typeId
	 * @return
	 */
	public List<ComType> getComsByTypeId(String typeId);

	/**
	 * 根据组件名称获取组件信息
	 * 
	 * @param name
	 * @return
	 */
	public List<Component> getComsByName(String name);

	/**
	 * 根据组件的id查询组件
	 * 
	 * @param comId
	 * @return
	 */

	public Component getComsByComponentId(String comId);

	/**
	 * 根据发布时间推荐组件
	 * 
	 * @return
	 */
	public List<Component> getComsOrderByCreateTime(String typeId);

	/**
	 * 根据最多浏览次数推荐组件
	 * 
	 * @return
	 */
	public List<Component> getComsOrderByViewCounts(String typeId);

	/**
	 * 更新浏览次数
	 */
	public void updateViewCount(Component component);

	/**
	 * 按照评论数降序排列
	 * 
	 * @return
	 */
	public List<Component> getComsOrderByCommentCounts(String typeId);

	/**
	 * 组件分类情况下根据下载量对组件进行排序
	 * 
	 * @return
	 */
	public List<Component> getComsOrderByDownloadCounts(String typeId);

	/**
	 * 修改评论数
	 * 
	 * @return
	 */
	public void updateFeedBackCounts(Component component);
}
