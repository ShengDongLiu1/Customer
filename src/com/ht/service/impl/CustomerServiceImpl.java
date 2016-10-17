package com.ht.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.stereotype.Service;

import com.ht.bean.Customer;
import com.ht.dao.CustomerDao;
import com.ht.service.CustomerService;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Resource
	private CustomerDao customerDao;
	
	@Override
	public void cadd(Customer customer) {
		customerDao.cadd(customer);
	}

	@Override
	public void csrdelete(int id) {
		customerDao.csrdelete(id);
	}

	@Override
	public void csrcupdate(Customer customer) {
		customerDao.csrcupdate(customer);
	}

	@Override
	public Customer csrselect(int id) {
		return customerDao.csrselect(id);
	}

	@Override
	public List<Customer> csrselectall() {
		return customerDao.csrselectall();
	}
	
	@Test
	public void test(){
		Customer csr = csrselect(1);
		System.out.println(csr.getComname());
	}

	@Override
	public List<Customer> queryAll(Map<String, Object> map) {
		return customerDao.queryAll(map);
	}

	@Override
	public Integer queryCount() {
		return customerDao.queryCount();
	}

	@Override
	public List<Customer> selectState(String state) {
		return customerDao.selectState(state);
	}
	
}
