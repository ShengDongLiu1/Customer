package com.ht.controller;




import java.util.ArrayList;
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
import com.ht.bean.Product;
import com.ht.common.Pager;
import com.ht.common.StringUtil;
import com.ht.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Resource
	private ProductService productService;
	
	@RequestMapping("/pselect")
	public String pselect(@RequestParam(value="pid",required=false)Integer pid,HttpServletResponse response,HttpServletRequest request)throws Exception{
		System.out.println("pid"+"==========");
		System.out.println(1);
		Product prd = productService.pselect(1);
		List<Product> list = new ArrayList<>();
		list.add(prd);
		System.out.println(prd.getPname());
		request.setAttribute("lists", list);
		return "product";
	}
	
	@RequestMapping("/queryAll")
	public String list2(@RequestParam(value="page",required=false)int page,Product product,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<Product> pager = new Pager<>();
		pager.setPageSize(10);
		int count = productService.queryCount();
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
		map.put("pname", StringUtil.formatLike(product.getPname()));
		map.put("ptype", StringUtil.formatLike(product.getPtype()));
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Product> userList=productService.queryAll(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		return "product";
	}
	
	//类型状态
	@RequestMapping("/queryState")
	public String queryState(@RequestParam(value="page",required=false)int page,@RequestParam(value="state",required=false)int state,Customer customer,HttpServletResponse response, HttpServletRequest request)throws Exception{
		List<Product> userList = null;
		Pager<Product> pager = new Pager<>();
		pager.setPageSize(10);
		pager.setPageNo(page);
		System.out.println(page);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		if(state==1){
			 userList=productService.selectState("办公");
		}else if(state==2){
			 userList=productService.selectState("体育");
		}
		else if(state==3){
			 userList=productService.selectState("建设");
		}else{
			 userList=productService.selectState("医疗");
		}
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		return "product";
	}

	
	
	@RequestMapping("/updapr")
	public String updapr(Product product,HttpServletResponse response,HttpServletRequest request){
		try {		
			System.out.println("**********product="+product);
			productService.pupdate(product);
			int page = Integer.valueOf(request.getParameter("page"));
			response.sendRedirect("queryAll.do?page="+page);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/proupdate")
	public String proupdate(@RequestParam(value="pid",required=false)String pid ,
			@RequestParam(value="page",required=false)int page,HttpServletRequest request)throws Exception{
		try {
			pid = pid.replace(" ", "");
		    Product product = productService.pselect(Integer.valueOf(pid));
			request.setAttribute("product", product);
			request.setAttribute("page", page);
			return "updteproduct";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("/pdelete")
	public String pdelete(@RequestParam(value="page",required=false)int page,@RequestParam(value="pid",required=false)String pid,HttpServletResponse response,HttpServletRequest request){
		try {	
			pid = pid.replace(" ", "");
			String []idsStr=pid.split(",");
		 for(int i=0;i<idsStr.length;i++){
			 productService.pdelect(Integer.parseInt(idsStr[i]));
		}
		 response.sendRedirect("queryAll.do?page="+page);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	/**
	 * 添加
	 * @param product
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/add")
	public String add(){
		return "addproduct";
	}
	@RequestMapping("/productAdd")
	public String productAdd(Product product,HttpServletResponse response,HttpServletRequest request){
		try {	
			System.out.println("**********product="+product);
			productService.padd(product);
			response.sendRedirect("queryAll.do?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
}
