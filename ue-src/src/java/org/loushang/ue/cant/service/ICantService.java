package org.loushang.ue.cant.service;

import java.util.List;

import org.loushang.ue.cant.data.Cant;

public interface ICantService {
	List<Cant> getCantBySuperCode(String superCode);
}
