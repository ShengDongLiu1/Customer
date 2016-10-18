package com.ht.service.impl;

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
}
