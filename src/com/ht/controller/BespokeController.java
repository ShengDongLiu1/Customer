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

import com.ht.bean.Bespoke;
import com.ht.common.PageBean;
import com.ht.service.BespokeService;

@Controller
@RequestMapping("/bespoke")
public class BespokeController {

	@Resource
	private BespokeService bespokeService;
	
	@RequestMapping("/bespokeSelect")
	public String bespokeSelect(@RequestParam(value="bepid",required=false)Integer bepid,HttpServletResponse response,HttpServletRequest request)throws Exception{
		try {	
		Bespoke bes= bespokeService.BespokeSelect(Integer.valueOf(bepid));
		request.setAttribute("bes", bes);
		return "updateBespoke";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	@RequestMapping("/bespokeQueryAll")
	public String bespokeQueryAll(Bespoke bespoke,HttpServletResponse response, HttpServletRequest request)throws Exception{
		PageBean pageBean=new PageBean(1,2);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Bespoke> beslist=bespokeService.BespokeQueryAll(map);
		System.out.println(beslist.size()+"-------------------");
		request.setAttribute("beslist", beslist);
		return "bespoke";
	}
	
	@RequestMapping("/update")
	public String update(@RequestParam(value="bepid",required=false)String bepid ,HttpServletRequest request)throws Exception{
		try {			
			Bespoke bespoke = bespokeService.BespokeSelect(Integer.valueOf(bepid));
			request.setAttribute("bespoke", bespoke);
			return "updateBespoke";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
}
