package org.loushang.ue.comtype.service.Impl;

import java.util.List;

import org.loushang.ue.comtype.data.ComType;

public interface IComTypeService {

	/**
	 * 初始化一级导航
	 * 
	 * @param parentId
	 * @return
	 */

	public List<ComType> getTopType();

	/**
	 * 初始化二级导航
	 * 
	 * @param parentId
	 * @return
	 */
	public List<ComType> getSubType(String parentId);
}
