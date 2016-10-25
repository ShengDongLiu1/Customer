package com.ht.service;

import java.util.List;
import java.util.Map;

import com.ht.bean.Product;

public interface ProductService {
	
	public void padd(Product product);
	public Product pselect(int id);
	public void pupdate(Product product);
	public void pdelect(int id);
	public List<Product> prselectall();
	public List<Product> queryAll(Map<String,Object> map);
	public int queryCount();
	public List<Product> selectState(String state);
}
