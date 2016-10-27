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

import com.ht.bean.Development;
import com.ht.common.Pager;
import com.ht.service.DevelopmentService;

@Controller
@RequestMapping("development")
public class DevelopmentController {
	
	@Resource
	private DevelopmentService developmentService;
	
	@RequestMapping("/queryAll")
	public String list2(@RequestParam(value="page",required=false)int page,Development development,HttpServletResponse response, HttpServletRequest request)throws Exception{
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
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Development> userList=developmentService.find(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		return "development";
	}
	
}
