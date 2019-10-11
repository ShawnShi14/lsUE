package org.loushang.ue.cant.service.impl;

import java.util.List;

import org.loushang.ue.cant.dao.CantMapper;
import org.loushang.ue.cant.data.Cant;
import org.loushang.ue.cant.service.ICantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cantService")
public class CantServiceImpl implements ICantService {

	@Autowired
	private CantMapper cantMapper;

	@Override
	public List<Cant> getCantBySuperCode(String superCode) {
		return cantMapper.getCantBySuperCode(superCode);
	}

}
