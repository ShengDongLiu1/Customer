package com.ht.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ht.bean.Login;
import com.ht.service.LoginService;

@Controller
@RequestMapping("/")
public class LoginController {
	
	/**
	 * 登录
	 * @param userid
	 * @param login
	 * @param req
	 * @return
	 */
	@Resource
	private LoginService loginService;
	
	@RequestMapping("/login")
	public String userLogin(Login login,String code, HttpServletRequest req,HttpSession session){
		System.out.println("++++++++++++++++++++++++++++++++++++验证码:"+code);
		if(code.equals(session.getAttribute("code"))){
			Login userLogin = loginService.login(login);
			session.setAttribute("user", userLogin);
			return "index";
		}else{
			return "login";
		}	
	}	
	
	/**
	 * 根据id查询原密码
	 * @param userid
	 * @param login
	 * @param req
	 * @return
	 */
	@RequestMapping("/selectmima")
	public String selectmima(@RequestParam(value="userid",required=false)Integer userid,Login login, HttpServletRequest req){
		login.setUserid(userid);
		Login selectmima = loginService.selectmima(login);
			req.setAttribute("selectmima", selectmima);
			return "updatemima";
		
	}
	
	/**
	 * 修改密码
	 * @param login
	 * @param req
	 * @return
	 */
	@RequestMapping("/updatamima")
	public String updatamima(@RequestParam("userid") String userid,@RequestParam("newpassword") String newpassword, HttpServletRequest req){
		Login updatemima2 = null;
		try{
			Login login1 = new Login();
			login1.setUserid(Integer.valueOf(userid));
			login1.setPassword(newpassword);
			loginService.updatemima(login1);
			return "login";
		}catch(Exception e){
			req.setAttribute("user", updatemima2);
			req.setAttribute("errorLogin", "修改密码失败。");
			return "updatemima";
		}
	}
}
