package com.ht.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ht.bean.Contact;
import com.ht.service.ContactService;

@Controller
@RequestMapping("/contact")
public class ContactController {
	
	@Resource
	private ContactService contactService;
	
	@RequestMapping("/contactAdd")
	public String Contact_add(HttpServletRequest req){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String datetime = df.format(new Date());
		req.setAttribute("datetimes", datetime);
		return "Contact/ContactAdd";
	}
	
	@RequestMapping("/contactAddqr")
	public String contactAddqr(Contact contact, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		try{
			System.out.println("**********contact="+contact.getManname());
			contactService.contactAdd(contact);
			return "Contact/ContactManage";
		}catch(Exception e){
			e.printStackTrace();
			req.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("/contactQueryPager")
	public String contactQueryPager(){
		return "Contact/ContactManage";
	}
	
	
	
}
