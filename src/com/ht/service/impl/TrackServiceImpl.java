package com.ht.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.bean.Customer;
import com.ht.bean.Login;
import com.ht.bean.Track;
import com.ht.dao.TrackDao;
import com.ht.service.TrackService;

@Service("trackService")
public class TrackServiceImpl implements TrackService {
	@Resource
	private TrackDao trackDao;

	@Override
	public void takadd(Track track) {
		trackDao.takadd(track);
	}

	@Override
	public void takdelete(int id) {
		trackDao.takdelete(id);
	}

	@Override
	public void takcupdate(Track track) {
		trackDao.takcupdate(track);
	}

	@Override
	public Track takselect(int id) {
		return trackDao.takselect(id);
	}

	@Override
	public List<Track> queryAlls(Map<String, Object> map) {
		return trackDao.queryAlls(map);
	}


	@Override
	public int trackQueryCount() {
		return trackDao.trackQueryCount();
	}

	@Override
	public List<Login> LoginSelect() {
		
		return trackDao.LoginSelect();
	}

	@Override
	public List<Customer> CustomerSelect() {
		
		return trackDao.CustomerSelect();
	}

	@Override
	public List<Track> queryAllss(Map<String, Object> map) {
		
		return trackDao.queryAllss(map);
	}

	@Override
	public int queryCount() {
		return trackDao.queryCount();
	}
	

}
