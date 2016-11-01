package com.ht.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Customer;
import com.ht.bean.Development;
import com.ht.bean.Marketing;
import com.ht.bean.User;
import com.ht.common.Pager;
import com.ht.service.DevelopmentService;
import com.ht.service.MarketingService;

@Controller
@RequestMapping("development")
public class DevelopmentController {
	
	@Resource
	private DevelopmentService developmentService;
	
	@Resource
	private MarketingService marketingService;
	
	
	@RequestMapping("/queryById")
	public void queyById(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		id = id.replace(" ", "");//替换
		id = id.replace(",", "");//替换
		Integer id1 = Integer.valueOf(id);
		PrintWriter writer = response.getWriter();
		response.setContentType("text/json");
		if(!id1.equals("") && id1!=null){
			Development development = developmentService.findById(id1);
			writer.write(JSON.toJSONString(development));
		}
	}
	
	@RequestMapping("/querymarketing")
	public String queyById1(@RequestParam(value="id")Integer id,HttpServletRequest request, HttpServletResponse response) throws IOException{
		if(!id.equals("") && id!=null){
			Integer page = Integer.valueOf(request.getParameter("page"));
			Marketing marketing = marketingService.findById(id);
			request.setAttribute("marketing", marketing);
			List<User> userName = marketingService.selectUserName();
			List<Customer> CustomerName = marketingService.selectCustomerName();
			Pager<Development> pager = new Pager<>();
			pager.setPageSize(10);
			int count = developmentService.getTotal();
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
			map.put("saleChanceId", id);
			map.put("start", pager.getBeginIndex());
			map.put("size", pager.getPageSize());
			List<Development> lists = developmentService.find(map);
			request.setAttribute("saleChanceId", id);
			request.setAttribute("userName", userName);
			request.setAttribute("CustomerName", CustomerName);
			if(lists.size()<1){
				request.setAttribute("wushuju", "暂无计划");
			}else{
				pager.setRows(lists);
				request.setAttribute("lists", pager);
			}
		}
		return "develop";
	}
	
	
	@RequestMapping("addqr")
	public String addMarketing(@RequestParam(value="id")Integer id,Development development, HttpServletResponse resp,HttpServletRequest request){
		try{
			development.setSaleChanceId(id);
			developmentService.add(development);
			Marketing marketing = new Marketing();
			marketing.setId(id);
			marketing.setDevResult(1);
			marketingService.update(marketing);
			resp.sendRedirect("querymarketing.do?page=1&id="+id);
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
		
	}
	
	@RequestMapping("/queryAll")
	public String list2(@RequestParam(value="page",required=false)int page,Marketing marketing,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<Marketing> pager = new Pager<>();
		pager.setPageSize(10);
		int count = marketingService.getTotal();
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
		List<Marketing> userList=marketingService.find(map);
		List<User> userName = marketingService.selectUserName();
		List<Customer> CustomerName = marketingService.selectCustomerName();
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		request.setAttribute("userName", userName);
		request.setAttribute("CustomerName", CustomerName);
		return "development";
	}
	
	
	@RequestMapping("/updateqr")
	public String update(Development development,HttpServletResponse response,HttpServletRequest request){
		try {	
			developmentService.update(development);
			response.sendRedirect("querymarketing.do?page=1&id="+development.getSaleChanceId());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	@RequestMapping("/kaifac")
	public String kaifac(Marketing marketing,HttpServletResponse response,HttpServletRequest request){
		try {	
			Integer devResult = Integer.valueOf(request.getParameter("devResult"));
			Integer id = Integer.valueOf(request.getParameter("id"));
			if(devResult!=null && !devResult.equals("")){
				marketing.setId(id);
				marketing.setDevResult(devResult);
				marketingService.update(marketing);
				response.sendRedirect("queryAll.do?page=1");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="page",required=false)int page,@RequestParam(value="id",required=false)String kid,HttpServletResponse response,HttpServletRequest request){
		try {	
			Integer id = Integer.valueOf(request.getParameter("idd"));
			kid = kid.replace(" ", "");//替换
			String []idsStr=kid.split(",");//拆分
		 for(int i=0;i<idsStr.length;i++){
			 developmentService.delete(Integer.parseInt(idsStr[i]));
		 }
		 response.sendRedirect("querymarketing.do?page="+page+"&id="+id);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
}
