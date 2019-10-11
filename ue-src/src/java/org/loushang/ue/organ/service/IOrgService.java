package org.loushang.ue.organ.service;

import java.util.List;

import org.loushang.ue.organ.data.Organ;

public interface IOrgService {

	/**
	 * 查找所有的节点
	 * 
	 * @return
	 */
	public List<Organ> findAllNodes(String parentId);

	/**
	 * 增加节点
	 * 
	 * @param id
	 * @param name
	 * @param parentId
	 */
	public void addNode(String id, String name, String parentId);

	/**
	 * 通过id查找节点信息
	 * 
	 * @param id
	 * @return
	 */
	public Organ findById(String id);

	/**
	 * 更改isParent属性的值
	 * 
	 * @param id
	 */
	public void updateIsParentT(String id);

	/**
	 * 当父节点没有子节点的时候，设置isParent为false
	 * 
	 * @param id
	 */
	public void updateIsParentF(String id);

	/**
	 * 修改节点信息
	 * 
	 * @param id
	 * @param name
	 */
	public void updateNode(String id, String name);

	/**
	 * 根据id删除节点
	 * 
	 * @param id
	 */
	public void deleteNode(String id);

}
