package com.ht.service;

import java.util.List;
import java.util.Map;

import com.ht.bean.Contact;

public interface ContactService {
	public void contactAdd(Contact contact);
	
	public List<Contact> queryAll(Map<String,Object> map);
	
	public void contactDelete(int manid);
	
	public void contactUpdate(Contact contact);
	
	public Contact contactById(int manid);
}
