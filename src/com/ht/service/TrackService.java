package com.ht.service;

import java.util.List;

import com.ht.bean.Track;

public interface TrackService {

	public void takadd(Track track);
	
	public void takdelete(int id);
	
	public void takcupdate(Track track);
	
	public Track takselect(int id);
	
	public List<Track> takselectall();
}
