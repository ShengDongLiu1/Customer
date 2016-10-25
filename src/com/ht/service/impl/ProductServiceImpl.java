package com.ht.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.bean.Product;
import com.ht.dao.ProductDao;
import com.ht.service.ProductService;

@Service("ProductServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Resource
	private ProductDao productDao;
	@Override
	public void padd(Product product) {
		productDao.padd(product);
		
	}

	@Override
	public void pupdate(Product product) {
		productDao.pupdate(product);
		
	}
	
	@Override
	public Product pselect(int id) {
		return productDao.pselect(id);
	}
	
	@Override
	public void pdelect(int id) {
		productDao.pdelect(id);
		
	}

	@Override
	public List<Product> prselectall() {
		
		return productDao.prselectall();
	}

	@Override
	public List<Product> queryAll(Map<String, Object> map) {
		return productDao.queryAll(map);
	}

	@Override
	public int queryCount() {
		
		return productDao.queryCount();
	}

	@Override
	public List<Product> selectState(String state) {
		
		return productDao.selectState(state);
	}
	
}
