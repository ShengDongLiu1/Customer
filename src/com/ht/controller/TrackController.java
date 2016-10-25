package com.ht.controller;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.ht.bean.Customer;
import com.ht.bean.Track;
import com.ht.common.Pager;
import com.ht.common.StringUtil;
import com.ht.service.ContactService;
import com.ht.service.CustomerService;
import com.ht.service.TrackService;

@Controller
@RequestMapping("/track")
public class TrackController {
	@Resource
	private TrackService trackService;
	
	@Resource
	private CustomerService customerService;
	
	@Resource
	private ContactService contactService;
	
	
	@RequestMapping("/skip")
	public String skip(String kid ,HttpServletRequest request)throws Exception{
		try {
		    Customer customer = customerService.csrselect(Integer.valueOf(kid));
			request.setAttribute("customer", customer);
			return "Trace/traceAdd";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("/add")
	public String Track_add(Track track,String recordtime,HttpServletRequest request,HttpServletResponse response) throws Exception{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		track.setRecordtime(df.format(new Date()));
		trackService.takadd(track);
		response.sendRedirect("/Customer/track/trackQueryPagers.do?page=1");
		return null;
	}

	
	@RequestMapping("/tackQueryPager")
	public String contactQueryPager(@RequestParam(value="page",required=false)int page,Track track,HttpServletResponse response, HttpServletRequest request,HttpSession session){
		Pager<Track> pager = new Pager<>();
		pager.setPageSize(10);
		int count = trackService.trackQueryCount(); 
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
		String i = track.getKid().toString();
		if(i != "0"){
			map.put("kid", i);
		}else{
			map.put("kid", null);
		}
		/*Map<String,Object> map=new HashMap<String,Object>();
		map.put("kid",StringUtil.formatLike(track.getKid()+""));*/
		map.put("measure", StringUtil.formatLike(track.getMeasure()));
		map.put("recordtime",StringUtil.formatLike(track.getRecordtime()));
		map.put("start", pager.getBeginIndex()); 
		map.put("size", pager.getPageSize());
		List<Track> userList=trackService.queryAllss(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		List<Customer> listName=contactService.customerSelect();
		request.setAttribute("listName", listName);
		return "Trace/pagingSelect";
	}
	
	
	@RequestMapping("/trackQueryPagers")
	public String bespokeQueryAll(@RequestParam(value="page",required=false)int page, Track track,HttpServletResponse response, HttpServletRequest request,HttpSession session)throws Exception{
		Pager<Track> pager = new Pager<>();
		pager.setPageSize(10);
		pager.setPageNo(page);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Track> userList=trackService.queryAlls(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		List<Customer> listName=contactService.customerSelect();
		request.setAttribute("listName", listName);
		return "Trace/pagingSelect";
	}
	
	@RequestMapping("/trackUpdate")
	public String trackUpdate(Track track,HttpServletRequest request,HttpServletResponse response){
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String recordtime = df.format(new Date());
			track.setRecordtime(recordtime);
			trackService.takcupdate(track);
			response.sendRedirect("/Customer/track/trackQueryPagers.do?page=1");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("/skiPage")
	public String skiPage(String tid , HttpServletRequest request)throws Exception{
		try {
			Track track = trackService.takselect(Integer.valueOf(tid));
			System.out.println(track);
			request.setAttribute("track", track);
			return "Trace/traceUpdate";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("/trackDelete")
	public String trackDelete(String tid,HttpServletRequest request,HttpServletResponse response) throws Exception{
		tid = tid.replace(" ", "");
		String []idsStr=tid.split(",");
		for(int i=0;i<idsStr.length;i++){
			trackService.takdelete(Integer.valueOf(idsStr[i]));
		}
		response.sendRedirect("/Customer/track/trackQueryPagers.do?page=1");
		return null;
	}	
}
