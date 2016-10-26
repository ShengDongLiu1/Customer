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

import com.ht.bean.User;
import com.ht.common.AES;
import com.ht.common.Pager;
import com.ht.common.StringUtil;
import com.ht.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	@RequestMapping("/UserQueryAll")
	public String UserQueryAll(@RequestParam(value="page",required=false)int page,User user,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<User> pager = new Pager<>();
		pager.setPageSize(10);
		pager.setPageNo(page);
		int count = userService.UserQueryCount();
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
		List<User> userList=userService.UserQueryAll(map);
		pager.setRows(userList);
		request.setAttribute("userList", pager);
		return "user";
	}
	@RequestMapping("/userSelect")
	public String UserSelect(@RequestParam(value="userid",required=false)String id,User user,HttpServletResponse response, HttpServletRequest request)throws Exception{
		User use=userService.UserSelect(Integer.valueOf(id));
		List<Integer> age=new ArrayList<Integer>();
		for (int i = 18; i < 50; i++) {
			age.add(i);
		}
		request.setAttribute("uage", age);
		request.setAttribute("uuser", use);
		return "updateUser";
	}
	@RequestMapping("UserUpdate")
	public String updateqr(User user,HttpServletResponse response, HttpServletRequest request)throws Exception{
	try {			
		userService.UserUpdate(user);
		response.sendRedirect("UserQueryAll.do?page=1");
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		return "result";
	}
	return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="userid",required=false)String id,HttpServletResponse response,HttpServletRequest request){
		try {			
			userService.UserDelete(Integer.valueOf(id));
			response.sendRedirect("UserQueryAll.do?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/addUser")
	public String add(HttpServletResponse response,HttpServletRequest request){	
		List<Integer> age=new ArrayList<Integer>();
		for (int i = 18; i < 50; i++) {
			age.add(i);
		}
		request.setAttribute("uage", age);
		return "addUser";
	}
	
	@RequestMapping("/addqr")
	public String add(User user,HttpServletResponse response,HttpServletRequest request){
		try {	
			user.setPassword(AES.getInstance().encrypt(user.getPassword()));
			userService.UserAdd(user);
			response.sendRedirect("UserQueryAll.do?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/userSelects")
	public String UserSelects(@RequestParam(value="page",required=false)int page,User user,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<User> pager = new Pager<>();
		pager.setPageSize(10);
		
		int count = userService.UserQueryCount();
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
		map.put("email", StringUtil.formatLike(user.getEmail()));
		map.put("status", StringUtil.formatLike(user.getStatus()));
		map.put("uname", StringUtil.formatLike(user.getUname()));
		map.put("usex", StringUtil.formatLike(user.getUsex()));
		map.put("unumber", StringUtil.formatLike(user.getUnumber()));
		map.put("uage", user.getUage());
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Integer> age=new ArrayList<Integer>();
		for (int i = 18; i < 50; i++) {
			age.add(i);
		}
		request.setAttribute("uage", age);
		List<User> userList=userService.UserSelects(map);
		pager.setRows(userList);
		request.setAttribute("userList", pager);
		return "user";
	}
}
