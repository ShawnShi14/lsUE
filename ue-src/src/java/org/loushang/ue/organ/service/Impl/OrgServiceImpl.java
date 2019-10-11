package org.loushang.ue.organ.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.loushang.ue.organ.dao.OrgMapper;
import org.loushang.ue.organ.data.Organ;
import org.loushang.ue.organ.service.IOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("orgService")
@Transactional("mybatisTransactionManager")
public class OrgServiceImpl implements IOrgService {

	@Autowired
	private OrgMapper orgMapper;

	// 遍历所有的节点
	@Override
	public List<Organ> findAllNodes(String parentId) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("parentId", parentId);
		return orgMapper.findAllNodes(map);
	}

	// 增加一个节点
	@Override
	public void addNode(String id, String name, String parentId) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("id", id);
		map.put("name", name);
		map.put("parentId", parentId);
		orgMapper.addNode(map);
	}

	// 通过id查找节点信息
	@Override
	public Organ findById(String id) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("id", id);
		return orgMapper.findById(map);
	}

	// 修改isParent属性的值
	@Override
	public void updateIsParentT(String id) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("id", id);
		orgMapper.updateIsParentT(map);

	}

	// 修改节点
	@Override
	public void updateNode(String id, String name) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("id", id);
		map.put("name", name);
		orgMapper.updateNode(map);
	}

	// 删除节点
	@Override
	public void deleteNode(String id) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("id", id);
		orgMapper.deleteNode(map);
	}

	// 将父节点的字段值设置为false
	@Override
	public void updateIsParentF(String id) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("id", id);
		orgMapper.updateIsParentF(map);

	}

}
