package org.loushang.ue.cant.dao;

import java.util.List;

import org.loushang.ue.cant.data.Cant;

public interface CantMapper {
	List<Cant> getCantBySuperCode(String superCode);
}
