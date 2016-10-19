package com.ht.service;

import com.ht.bean.Login;

public interface LoginService {
	public Login login(Login login);
	
	/**
	 * 修改密码
	 * @param login
	 * @return
	 */
	public void updatemima(Login login);
	
	/**
	 * 查询原始密码
	 * @param login
	 * @return
	 */
	public Login selectmima(Login login);
}
