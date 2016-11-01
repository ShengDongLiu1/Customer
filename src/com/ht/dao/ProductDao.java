package com.ht.dao;

import java.util.List;
import java.util.Map;

import com.ht.bean.Customer;
import com.ht.bean.CustomerFw;
import com.ht.bean.Product;

public interface ProductDao {
	
	public void padd(Product product);
	public Product pselect(int id);
	public void pupdate(Product product);
	public void pdelect(int id);
	public List<Product> prselectall();
	public List<Product> queryAll(Map<String,Object> map);
	public int queryCount();
	public List<Product> selectState(String state);
	public List<CustomerFw> findCustomerFw();
}
