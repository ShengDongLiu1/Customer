package com.ht.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
	public List<Track> takselectall() {
		return trackDao.takselectall();
	}
	

}
