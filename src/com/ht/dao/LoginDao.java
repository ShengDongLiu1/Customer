package com.ht.dao;

import com.ht.bean.Login;

public interface LoginDao {
	
	public Login login(Login login);
	public Login selectmima(Login login);
	public void updatemima(Login login);
}
