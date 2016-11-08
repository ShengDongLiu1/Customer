package com.ht.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ht.bean.Contact;
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

	// 查看客户
	@RequestMapping("/queryState")
	public String queryState(@RequestParam(value = "page", required = false) int page,
			@RequestParam(value = "state", required = false) int state, Customer customer, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		List<Customer> userList = null;
		Pager<Customer> pager = new Pager<>();
		pager.setPageSize(10);
		Map<String, Object> ma = new HashMap<>();
		int count = 0;
		if (state == 1) {
			customer.setState("潜在客户");
		} else if (state == 2) {
			customer.setState("正式客户");
		} else if (state == 3) {
			customer.setState("放弃客户");
		} else if (state == 4) {
			customer.setState("签约客户");
		} else {
			customer.setState("");
		}
		count = customerService.queryCount(customer.getState());
		int total = count % pager.getPageSize() == 0 ? count / pager.getPageSize() : count / pager.getPageSize() + 1;
		pager.setTotal(total);
		if (page >= 1 && page <= pager.getTotal()) {
			pager.setPageNo(page);
		} else if (page < 1) {
			pager.setPageNo(1);
		} else if(pager.getTotal() == 0){
			pager.setPageNo(1);
		}else{
			pager.setPageNo(pager.getTotal());
		}
		ma.put("start", pager.getBeginIndex());
		ma.put("state", customer.getState());
		ma.put("size", pager.getPageSize());
		userList = customerService.queryAll(ma);
		request.setAttribute("state", state);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		return "Trace/clientSelect";

	}

	@RequestMapping("/queryAll")
	public String list2(@RequestParam(value = "page", required = false) int page,
			@RequestParam(value = "state", required = false) int state, Customer customer,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Pager<Customer> pager = new Pager<>();
		pager.setPageSize(10);
		if (state == 1) {
			customer.setState("潜在客户");
		} else if (state == 2) {
			customer.setState("正式客户");
		} else if (state == 3) {
			customer.setState("放弃客户");
		} else if (state == 4) {
			customer.setState("签约客户");
		} else{
			customer.setState("");
		}
		int count = customerService.queryCount(customer.getState());
		map.put("state", StringUtil.formatLike(customer.getState()));
		int total = count % pager.getPageSize() == 0 ? count / pager.getPageSize() : count / pager.getPageSize() + 1;
		pager.setTotal(total);
		if (page >= 1 && page <= pager.getTotal()) {
			pager.setPageNo(page);
		} else if (page < 1) {
			pager.setPageNo(1);
		} else if(pager.getTotal() == 0){
			pager.setPageNo(1);
		}else{
			pager.setPageNo(pager.getTotal());
		}
		map.put("comname", StringUtil.formatLike(customer.getComname()));
		map.put("atype", StringUtil.formatLike(customer.getAtype()));
		map.put("comaddress", StringUtil.formatLike(customer.getComaddress()));
		map.put("product", StringUtil.formatLike(customer.getProduct()));
		map.put("testman", StringUtil.formatLike(customer.getTestman()));
		map.put("designated", StringUtil.formatLike(customer.getDesignated()));
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Customer> userList = customerService.queryAll(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		request.setAttribute("state", state);
		return "Trace/clientSelect";
	}

	@RequestMapping("/skip")
	public String skip(String kid, HttpServletRequest request) throws Exception {
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
	public String Track_add(Track track, String recordtime, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		track.setRecordtime(df.format(new Date()));
		trackService.takadd(track);
		response.sendRedirect("/Customer/track/trackQueryPagers.do?page=1");
		return null;
	}

	@RequestMapping("/tackQueryPager")
	public String contactQueryPager(@RequestParam(value = "page", required = false) int page, Track track,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
		Pager<Track> pager = new Pager<>();
		pager.setPageSize(10);
		int count = trackService.trackQueryCount();
		if (count > 0) {

			int total = count % pager.getPageSize() == 0 ? count / pager.getPageSize()
					: count / pager.getPageSize() + 1;
			pager.setTotal(total);
			if (page >= 1 && page <= pager.getTotal()) {
				pager.setPageNo(page);
			}  else if (page < 1) {
				pager.setPageNo(1);
			} else if(pager.getTotal() == 0){
				pager.setPageNo(1);
			}else{
				pager.setPageNo(pager.getTotal());
			}
			Map<String, Object> map = new HashMap<String, Object>();
			/*
			 * String i = track.getKid().toString(); if(i != "0"){
			 * map.put("kid", i); }else{ map.put("kid", null); }
			 */
			/*
			 * Map<String,Object> map=new HashMap<String,Object>();
			 * map.put("kid",StringUtil.formatLike(track.getKid()+""));
			 */
			map.put("measure", StringUtil.formatLike(track.getMeasure()));
			map.put("recordtime", StringUtil.formatLike(track.getRecordtime()));
			map.put("start", pager.getBeginIndex());
			map.put("size", pager.getPageSize());
			List<Track> userList = trackService.queryAllss(map);
			pager.setRows(userList);
		} else {
			request.setAttribute("tishi", "tishi");
		}
		request.setAttribute("lists", pager);
		/*
		 * List<Customer> listName=contactService.customerSelect();
		 * request.setAttribute("listName", listName);
		 */
		return "Trace/pagingSelect";
	}

	@RequestMapping("/trackQueryPagers")
	public String bespokeQueryAll(@RequestParam(value = "page", required = false) int page, Track track,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
		Pager<Track> pager = new Pager<>();
		pager.setPageSize(10);
		pager.setPageNo(page);
		int count = trackService.queryCount();
		int total = count % pager.getPageSize() == 0 ? count / pager.getPageSize() : count / pager.getPageSize() + 1;
		pager.setTotal(total);
		if (page >= 1 && page <= pager.getTotal()) {
			pager.setPageNo(page);
		} else if (page < 1) {
			pager.setPageNo(1);
		} else if(pager.getTotal() == 0){
			pager.setPageNo(1);
		}else{
			pager.setPageNo(pager.getTotal());
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Track> userList = trackService.queryAlls(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		/*
		 * List<Customer> listName=contactService.customerSelect();
		 * request.setAttribute("listName", listName);
		 */
		return "Trace/pagingSelect";
	}

	@RequestMapping("/trackUpdate")
	public String trackUpdate(Track track, HttpServletRequest request, HttpServletResponse response) {
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
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
	public String skiPage(String tid, HttpServletRequest request) throws Exception {
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
	public String trackDelete(String tid, HttpServletRequest request, HttpServletResponse response) throws Exception {
		tid = tid.replace(" ", "");
		String[] idsStr = tid.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			trackService.takdelete(Integer.valueOf(idsStr[i]));
		}
		response.sendRedirect("/Customer/track/trackQueryPagers.do?page=1");
		return null;
	}

	// 数据导出
	@RequestMapping("/daochu")
	public String daochu(Track track, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 声明一个工作薄
		HSSFWorkbook hwb = new HSSFWorkbook();
		// 声明一个单子并命名
		HSSFSheet sheet = hwb.createSheet("联络表");
		// 给单子名称一个长度
		sheet.setDefaultColumnWidth((int) 15);
		// 生成一个样式
		HSSFCellStyle style = hwb.createCellStyle();
		// 创建第一行（也可以称为表头）
		HSSFRow row = sheet.createRow(0);
		// 样式字体居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		// 给表头第一行一次创建单元格
		HSSFCell cell = row.createCell((int) 0);
		cell.setCellValue("编号");
		cell.setCellStyle(style);
		cell = row.createCell((int) 1);
		cell.setCellValue("客户公司");
		cell.setCellStyle(style);
		cell = row.createCell((int) 2);
		cell.setCellValue("记录语句");
		cell.setCellStyle(style);
		cell = row.createCell((int) 3);
		cell.setCellValue("记录人员");
		cell.setCellStyle(style);
		cell = row.createCell((int) 4);
		cell.setCellValue("记录时间");
		cell.setCellStyle(style);
		cell = row.createCell((int) 5);

		Pager<Track> pager = new Pager<>();
		pager.setPageNo(1);
		pager.setPageSize(100);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Track> list = null;
		list = trackService.queryAlls(map);
		try {
			// 向单元格里填充数据
			for (short i = 0; i < list.size(); i++) {
				row = sheet.createRow(i + 1);
				row.createCell(0).setCellValue(list.get(i).getTid());
				row.createCell(1).setCellValue(list.get(i).getCustomer().getComname());
				row.createCell(2).setCellValue(list.get(i).getMeasure());
				row.createCell(3).setCellValue(list.get(i).getCustomer().getTestman());
				row.createCell(4).setCellValue(list.get(i).getRecordtime());
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		try {
			File file = new File("D:/导出文件");
			if (file.exists() == false) {
				file.mkdir();
			}
			/* 导出的数据放在d盘的 导出文件 的文件夹里 */
			FileOutputStream out = new FileOutputStream("D:/导出文件/跟踪记录信息.xls");
			hwb.write(out);
			out.flush();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		response.sendRedirect("/Customer/track/trackQueryPagers.do?page=1");
		return null;
	}
}
