package com.ht.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.ht.bean.User;
import org.springframework.stereotype.Service;

import com.ht.bean.Customer;
import com.ht.bean.Marketing;
import com.ht.dao.MarketingDao;
import com.ht.service.MarketingService;

@Service("marketingService")
public class MarketingServiceimpl implements MarketingService {

	@Resource
	private  MarketingDao marketingDao;
	
	@Override
	public List<Marketing> find(Map<String, Object> map) {
		return marketingDao.find(map);
	}

	@Override
	public Integer getTotal(){
		return marketingDao.getTotal();
	}

	@Override
	public int add(Marketing marketing) {
		return marketingDao.add(marketing);
	}

	@Override
	public int update(Marketing marketing) {
		return marketingDao.update(marketing);
	}

	@Override
	public int delete(Integer id) {
		return marketingDao.delete(id);
	}

	@Override
	public Marketing findById(Integer id) {
		return marketingDao.findById(id);
	}

	@Override
	public List<Customer> selectCustomerName() {
		return marketingDao.selectCustomerName();
	}

	@Override
	public List<User> selectUserName() {
		return marketingDao.selectUserName();
	}


}
