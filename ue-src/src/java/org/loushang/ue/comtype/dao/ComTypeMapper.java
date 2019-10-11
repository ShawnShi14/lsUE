package org.loushang.ue.comtype.dao;

import java.util.List;
import java.util.Map;

import org.loushang.ue.com.data.Component;
import org.loushang.ue.comtype.data.ComType;

import tk.mybatis.mapper.common.Mapper;

public interface ComTypeMapper extends Mapper<Component> {

	public List<ComType> getTopType();

	public List<ComType> getSubType(Map map);

}
