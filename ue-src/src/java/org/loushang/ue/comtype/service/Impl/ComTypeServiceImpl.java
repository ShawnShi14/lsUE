package org.loushang.ue.comtype.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.loushang.ue.comtype.dao.ComTypeMapper;
import org.loushang.ue.comtype.data.ComType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional("mybatisTransactionManager")
public class ComTypeServiceImpl implements IComTypeService {

	@Autowired
	private ComTypeMapper comTypeMapper;

	@Override
	public List<ComType> getTopType() {
		// TODO Auto-generated method stub
		return comTypeMapper.getTopType();
	}

	@Override
	public List<ComType> getSubType(String parentId) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("parentId", parentId);
		return comTypeMapper.getSubType(map);
	}

}
