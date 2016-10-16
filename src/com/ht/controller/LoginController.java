package com.ht.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ht.bean.Login;
import com.ht.service.LoginService;

@Controller
@RequestMapping("/")
public class LoginController {
	
	@Resource
	private LoginService loginService;
	
	@RequestMapping("/login")
	public String userLogin(Login login, HttpServletRequest req){
		System.out.println("**********login="+login);
		Login userLogin = loginService.login(login);
		if(userLogin == null){
			req.setAttribute("user", userLogin);
			req.setAttribute("errorLogin", "用户名或密码有误。。。。。");
			return "login";
		}else{
			HttpSession session = req.getSession();
			session.setAttribute("user", userLogin);
			return "index";
		}
	}
}
