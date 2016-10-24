package com.ht.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.bean.User;
import com.ht.dao.UserDao;
import com.ht.service.UserService;
@Service("UserService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	
	@Override
	public void UserDelete(int id) {
		userDao.UserDelete(id);
		
	}

	@Override
	public void UserUpdate(User user) {
		userDao.UserUpdate(user);
		
	}

	@Override
	public User UserSelect(int id) {
		
		return userDao.UserSelect(id);
	}

	@Override
	public List<User> UserSelectall() {
	
		return userDao.UserSelectall();
	}

	@Override
	public List<User> UserQueryAll(Map<String, Object> map) {
		return userDao.UserQueryAll(map);
	}

	@Override
	public Integer UserQueryCount() {
		
		return userDao.UserQueryCount();
	}

	@Override
	public List<User> UserNameQueryAll() {
		return userDao.UserNameQueryAll();
	}

	@Override
	public void UserAdd(User user) {
		userDao.UserAdd(user);
		
	}

}
