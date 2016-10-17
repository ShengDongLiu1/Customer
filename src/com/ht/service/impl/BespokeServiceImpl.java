package com.ht.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.bean.Bespoke;
import com.ht.bean.Customer;
import com.ht.dao.BespokeDao;
import com.ht.service.BespokeService;

@Service("bespokeService")
public class BespokeServiceImpl implements BespokeService{
	@Resource
	private BespokeDao bespokeDao;

	@Override
	public void BespokeAdd(Bespoke bespoke) {
		bespokeDao.BespokeAdd(bespoke);
		
	}

	@Override
	public void BespokeDelete(int id) {
		bespokeDao.BespokeDelete(id);
		
	}

	@Override
	public void BespokeUpdate(Bespoke bespoke) {
		bespokeDao.BespokeUpdate(bespoke);
		
	}

	@Override
	public Bespoke BespokeSelect(int id) {
		return bespokeDao.BespokeSelect(id);
	}

	@Override
	public List<Bespoke> BespokeSelectall() {
		return bespokeDao.BespokeSelectall();
	}

	@Override
	public List<Bespoke> BespokeQueryAll(Map<String, Object> map) {
		return bespokeDao.BespokeQueryAll(map);
	}

	@Override
	public Integer BespokeQueryCount() {
		return bespokeDao.BespokeQueryCount();
	}

	@Override
	public List<Customer> CustomerSelectName() {
		return bespokeDao.CustomerSelectName();
	}
}
