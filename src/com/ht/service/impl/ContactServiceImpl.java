package com.ht.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.bean.Contact;
import com.ht.dao.ContactDao;
import com.ht.service.ContactService;

@Service("ContactService")
public class ContactServiceImpl implements ContactService {
	@Resource
	private ContactDao contactDao;

	@Override
	public void contactAdd(Contact contact) {
		contactDao.contactAdd(contact);
	}

	@Override
	public List<Contact> queryAll(Map<String, Object> map) {
		return contactDao.queryAll(map);
	}

	@Override
	public void contactDelete(int manid) {
		contactDao.contactDelete(manid);
	}

	@Override
	public void contactUpdate(Contact contact) {
		contactDao.contactUpdate(contact);
	}

	@Override
	public Contact contactById(int manid) {
		return contactDao.contactById(manid);
	}
}
