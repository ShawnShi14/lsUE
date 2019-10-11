package org.loushang.ue.organ.dao;

import java.util.List;
import java.util.Map;

import org.loushang.ue.organ.data.Organ;

import tk.mybatis.mapper.common.Mapper;

public interface OrgMapper extends Mapper<Organ> {

	public List<Organ> findAllNodes(Map map);

	public void addNode(Map map);

	public Organ findById(Map map);

	public void updateIsParentT(Map map);

	public void updateIsParentF(Map map);

	public void updateNode(Map map);

	public void deleteNode(Map map);
}
