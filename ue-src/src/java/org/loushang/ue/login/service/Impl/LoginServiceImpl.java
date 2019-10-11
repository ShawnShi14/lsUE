package org.loushang.ue.login.service.Impl;

import java.util.HashMap;
import java.util.Map;

import org.loushang.ue.login.service.ILoginService;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements ILoginService {
	 
	@Override
	public String getUserPass(String userName) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("superadmin", "superadmin");
		String password = map.get(userName);
		return password;
	}

}
