package com.ht.service;

import java.util.List;
import java.util.Map;

import com.ht.bean.User;

public interface UserService {
	
	public void UserDelete(int id);
	
	public void UserUpdate(User user);
	
	public User UserSelect(int id);
	
	public List<User> UserSelectall();
	
	public List<User> UserQueryAll(Map<String,Object> map);
	
	public Integer UserQueryCount();
	
}
