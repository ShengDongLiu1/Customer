package com.ht.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ht.bean.Bespoke;
import com.ht.bean.Contact;
import com.ht.bean.Customer;
import com.ht.common.Pager;
import com.ht.common.StringUtil;
import com.ht.service.ContactService;

@Controller
@RequestMapping("/contact")
public class ContactController {
	
	@Resource
	private ContactService contactService;
	
	/**
	 * 转到新增联络界面
	 * @param req
	 * @return
	 */
	@RequestMapping("/contactAdd")
	public String Contact_add(HttpServletRequest req){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String datetime = df.format(new Date());
		List<Customer> listName=contactService.customerSelect();
		req.setAttribute("listName", listName);
		req.setAttribute("datetimes", datetime);
		return "Contact/ContactAdd";
	}
	
	
	/**
	 * 新增联络
	 * @param contact
	 * @param req
	 * @param resp
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/contactAddqr")
	public String contactAddqr(Contact contact, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		try{
			System.out.println("**********contact="+contact.getManname());
			contactService.contactAdd(contact);
			resp.sendRedirect("contactQueryPagers.do?page=1");
		}catch(Exception e){
			e.printStackTrace();
			req.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	/**
	 * 转到管理联络界面并分页
	 * @param page
	 * @param contact
	 * @param response
	 * @param request
	 * @return
	 */
	
	@RequestMapping("/contactQueryPager")
	public String contactQueryPager(@RequestParam(value="page",required=false)int page,Contact contact,HttpServletResponse response, HttpServletRequest request){
		Pager<Contact> pager = new Pager<>();
		pager.setPageSize(10);
		int count = contactService.contactQueryCount();
		int total = count % pager.getPageSize() == 0 ? count / pager.getPageSize() : count / pager.getPageSize() +1;
		pager.setTotal(total);
		if(page >= 1 && page <= pager.getTotal()){
			pager.setPageNo(page);
		}else if(page < 1){
			pager.setPageNo(1);
		}else{
			pager.setPageNo(pager.getTotal());
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("mancom", StringUtil.formatLike(contact.getMancom()+""));
		map.put("manname", StringUtil.formatLike(contact.getManname()));
		map.put("mandep", StringUtil.formatLike(contact.getMandep()));
		map.put("manjob", StringUtil.formatLike(contact.getManjob()));
		map.put("manmobile", StringUtil.formatLike(contact.getManmobile()));
		map.put("manskill", StringUtil.formatLike(contact.getManskill()));
		map.put("logdate", StringUtil.formatLike(contact.getLogdate()));
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Contact> userList=contactService.queryAll(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		List<Customer> listName=contactService.customerSelect();
		request.setAttribute("listName", listName);
		return "Contact/ContactManage";
	}
	
	/**
	 * 分页
	 * @param page
	 * @param contact
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contactQueryPagers")
	public String bespokeQueryAll(@RequestParam(value="page",required=false)int page,Contact contact,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<Contact> pager = new Pager<>();
		pager.setPageSize(10);
		int count = contactService.contactQueryCount();
		int total = count % pager.getPageSize() == 0 ? count / pager.getPageSize() : count / pager.getPageSize() +1;
		pager.setTotal(total);
		if(page >= 1 && page <= pager.getTotal()){
			pager.setPageNo(page);
		}else if(page < 1){
			pager.setPageNo(1);
		}else{
			pager.setPageNo(pager.getTotal());
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Contact> userList=contactService.queryAlls(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		List<Customer> listName=contactService.customerSelect();
		request.setAttribute("listName", listName);
		return "Contact/ContactManage";
	}
	
	/**
	 * 删除联络
	 * @param page
	 * @param manid
	 * @param resp
	 * @param req
	 * @return
	 */
	@RequestMapping("/contactDelete")
	public String contactDelete(@RequestParam(value="page")int page,@RequestParam(value="manid") String manid, HttpServletResponse resp, HttpServletRequest req){
		try{
			manid = manid.replace(" ", "");
			String []idsStr=manid.split(",");
			for(int i=0;i<idsStr.length;i++){
				contactService.contactDelete(Integer.parseInt(idsStr[i]));
			}
			resp.sendRedirect("contactQueryPagers.do?page="+page);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	/**
	 * 修改联络1
	 * @param manid
	 * @param page
	 * @param req
	 * @return
	 */
	@RequestMapping("/contactUpdate")
	public String contactUpdate(@RequestParam(value="manid",required=false)String manid, @RequestParam(value="page",required=false)int page,HttpServletRequest req){
		try {
			manid = manid.replace(" ", "");
			System.out.println(245678);
			Contact contact = contactService.contactById(Integer.valueOf(manid));
			System.out.println(123456);
			req.setAttribute("contact", contact);
			req.setAttribute("page", page);
			List<Customer> listName=contactService.customerSelect();
			req.setAttribute("listName", listName);
			return "Contact/ContactUpdate";
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("InfoMessage", "信息修改失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	/**
	 * 修改联络2
	 * @param contact
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/contactUpdateqr")
	public String contactUpdateqr(Contact contact,HttpServletResponse response,HttpServletRequest request){
		try {			
			contactService.contactUpdate(contact);
			int page = Integer.valueOf(request.getParameter("page"));
			response.sendRedirect("contactQueryPagers.do?page="+page);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
}
