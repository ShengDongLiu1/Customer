package com.ht.controller;

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
import com.ht.common.Pager;
import com.ht.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	@RequestMapping("/UserQueryAll")
	public String UserQueryAll(@RequestParam(value="page",required=false)int page,User user,HttpServletResponse response, HttpServletRequest request)throws Exception{
		System.out.println("=============");
		Pager<User> pager = new Pager<>();
		pager.setPageSize(10);
		pager.setPageNo(page);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<User> userList=userService.UserQueryAll(map);
		pager.setRows(userList);
		request.setAttribute("userList", pager);
		return "user";
	}
	
	
}
