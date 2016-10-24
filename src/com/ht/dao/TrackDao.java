package com.ht.dao;

import java.util.List;

import java.util.Map;
import com.ht.bean.Customer;
import com.ht.bean.Login;
import com.ht.bean.Track;

public interface TrackDao {
	
	public void takadd(Track track);
	
	public void takdelete(int id);
	
	public void takcupdate(Track track);
	
	public Track takselect(int id);
	
	public int trackQueryCount();
	
	public List<Login> LoginSelect();
	
	public List<Customer> CustomerSelect();
	
	public List<Track> queryAlls(Map<String,Object> map);
	
	public List<Track> queryAllss(Map<String,Object> map);
	
}
