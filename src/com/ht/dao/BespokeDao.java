package com.ht.dao;

import java.util.List;
import java.util.Map;

import com.ht.bean.Bespoke;
import com.ht.bean.Customer;

public interface BespokeDao {
	public void BespokeAdd(Bespoke bespoke);
	
	public void BespokeDelete(int id);
	
	public void BespokeUpdate(Bespoke bespoke);
	
	public Bespoke BespokeSelect(int id);
	
	public List<Bespoke> BespokeSelectall();
	
	public List<Bespoke> BespokeQueryAll(Map<String,Object> map);
	
	public Integer BespokeQueryCount();
	
	public List<Customer> CustomerSelectName();
}
