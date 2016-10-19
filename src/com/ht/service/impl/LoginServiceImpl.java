package com.ht.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.bean.Login;
import com.ht.dao.LoginDao;
import com.ht.service.LoginService;

@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource
	private LoginDao loginDao;

	@Override
	public Login login(Login login) {
		return loginDao.login(login);
	}
	
	@Override
	public void updatemima(Login login) {
		
		loginDao.updatemima(login);
	}

	@Override
	public Login selectmima(Login login) {
		
		return loginDao.selectmima(login);
	}

}
