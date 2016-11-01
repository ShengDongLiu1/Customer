package com.ht.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.bean.Development;
import com.ht.dao.DevelopmentDao;
import com.ht.service.DevelopmentService;
 
@Service("developmentService")
public class DevelopmentServiceimpl implements DevelopmentService{
	
	@Resource
	private DevelopmentDao developmentDao;
	
	@Override
	public List<Development> find(Map<String, Object> map) {
		return developmentDao.find(map);
	}

	@Override
	public Integer getTotal(){
		return developmentDao.getTotal();
	}

	@Override
	public int update(Development cusDevPlan) {
		return developmentDao.update(cusDevPlan);
	}

	@Override
	public int add(Development cusDevPlan) {
		return developmentDao.add(cusDevPlan);
	}

	@Override
	public int delete(Integer id) {
		return developmentDao.delete(id);
	}

	@Override
	public Development findById(Integer id) {
		return developmentDao.findById(id);
	}
}
