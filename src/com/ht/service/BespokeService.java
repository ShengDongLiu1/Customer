package com.ht.service;

import java.util.List;
import java.util.Map;

import com.ht.bean.Bespoke;

public interface BespokeService {
public void BespokeAdd(Bespoke bespoke);
	
	public void BespokeDelete(int id);
	
	public void BespokeUpdate(Bespoke bespoke);
	
	public Bespoke BespokeSelect(int id);
	
	public List<Bespoke> BespokeSelectall();
	
	public List<Bespoke> BespokeQueryAll(Map<String,Object> map);
	
	public Integer BespokeQueryCount();
}
