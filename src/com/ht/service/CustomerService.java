package com.ht.service;

import java.util.List;
import java.util.Map;

import com.ht.bean.Customer;

public interface CustomerService {
	public void cadd(Customer customer);
	
	public void csrdelete(int id);
	
	public void csrcupdate(Customer customer);
	
	public Customer csrselect(int id);
	
	public List<Customer> csrselectall();
	
	public List<Customer> queryAll(Map<String,Object> map);
	
	public Integer queryCount();
	
	public List<Customer> selectState(String state);
}
