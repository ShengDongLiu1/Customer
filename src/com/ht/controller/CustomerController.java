package com.ht.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.ht.bean.Customer;
import com.ht.common.Pager;
import com.ht.common.StringUtil;
import com.ht.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Resource
	private CustomerService customerService;

	@RequestMapping("/crsselect")
	public String crsselect(@RequestParam(value="kid",required=false)Integer kid,HttpServletResponse response,HttpServletRequest request)throws Exception{
		System.out.println("adssdsa");
		System.out.println(1);
		Customer crs = customerService.csrselect(1);
		List<Customer> list = new ArrayList<>();
		list.add(crs);
		System.out.println(crs.getComname());
		request.setAttribute("lists", list);
		return "customer";
	}
	
	@RequestMapping("/queryAll")
	public String list2(@RequestParam(value="page",required=false)int page,Customer customer,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<Customer> pager = new Pager<>();
		pager.setPageSize(10);
		int count = customerService.queryCount();
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
		map.put("comname", StringUtil.formatLike(customer.getComname()));
		map.put("atype", StringUtil.formatLike(customer.getAtype()));
		map.put("comaddress", StringUtil.formatLike(customer.getComaddress()));
		map.put("product", StringUtil.formatLike(customer.getProduct()));
		map.put("testman", StringUtil.formatLike(customer.getTestman()));
		map.put("state", StringUtil.formatLike(customer.getState()));
		map.put("designated", StringUtil.formatLike(customer.getDesignated()));
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Customer> userList=customerService.queryAll(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		return "customer";
	}
	
	
	//潜在客户
	@RequestMapping("/queryState")
	public String queryState(@RequestParam(value="page",required=false)int page,@RequestParam(value="state",required=false)int state,Customer customer,HttpServletResponse response, HttpServletRequest request)throws Exception{
		List<Customer> userList = null;
		Pager<Customer> pager = new Pager<>();
		pager.setPageSize(10);
		pager.setPageNo(page);
		System.out.println(page);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		if(state==1){
			 userList=customerService.selectState("潜在客户");
		}else if(state==2){
			 userList=customerService.selectState("正式客户");
		}
		else if(state==3){
			 userList=customerService.selectState("放弃客户");
		}else{
			 userList=customerService.selectState("签约客户");
		}
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		return "customer";
	}

	@RequestMapping("/update")
	public String update(@RequestParam(value="kid",required=false)String kid ,
			@RequestParam(value="page",required=false)int page,HttpServletRequest request)throws Exception{
		try {
			kid = kid.replace(" ", "");
		    Customer customer = customerService.csrselect(Integer.valueOf(kid));

			request.setAttribute("customer", customer);
			request.setAttribute("page", page);
			return "updatecustomer";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("/updateqr")
	public String update(Customer customer,HttpServletResponse response,HttpServletRequest request){
		try {			
			customerService.csrcupdate(customer);
			int page = Integer.valueOf(request.getParameter("page"));
			response.sendRedirect("queryAll.do?page="+page);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="page",required=false)int page,@RequestParam(value="kid",required=false)String kid,HttpServletResponse response,HttpServletRequest request){
		try {	
			kid = kid.replace(" ", "");
			String []idsStr=kid.split(",");
		 for(int i=0;i<idsStr.length;i++){
			 customerService.csrdelete(Integer.parseInt(idsStr[i]));
		 }
		 response.sendRedirect("queryAll.do?page="+page);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/add")
	public String add(){
		return "addcustomer";
	}
	

	@RequestMapping("/addqr")
	public String addqr(Customer customer,HttpServletResponse response,HttpServletRequest request){
		try {	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss ");  
			customer.setNewdate(sdf.format(new Date()));
			customerService.cadd(customer);
			response.sendRedirect("queryAll.do?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
}
