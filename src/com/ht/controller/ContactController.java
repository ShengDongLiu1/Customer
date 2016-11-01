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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.ht.bean.Contact;
import com.ht.bean.Customer;
import com.ht.bean.Login;
import com.ht.common.Pager;
import com.ht.common.StringUtil;
import com.ht.service.ContactService;

@Controller
@RequestMapping("/contact")
public class ContactController {
	
	@Resource
	private ContactService contactService;
	
	/**
	 * 转到新增联络界面
	 * @param req
	 * @return
	 */
	@RequestMapping("/contactAdd")
	public String Contact_add(HttpServletRequest req){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String datetime = df.format(new Date());
		List<Customer> listName=contactService.customerSelect();
		req.setAttribute("listName", listName);
		req.setAttribute("datetimes", datetime);
		return "Contact/ContactAdd";
	}
	
	
	/**
	 * 新增联络
	 * @param contact
	 * @param req
	 * @param resp
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/contactAddqr")
	public String contactAddqr(Contact contact, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		try{
			System.out.println("**********contact="+contact.getManname());
			contactService.contactAdd(contact);
			resp.sendRedirect("contactQueryPagers.do?page=1");
		}catch(Exception e){
			e.printStackTrace();
			req.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	/**
	 * 转到管理联络界面并分页
	 * @param page
	 * @param contact
	 * @param response
	 * @param request
	 * @return
	 */
	
	@RequestMapping("/contactQueryPager")
	public String contactQueryPager(@RequestParam(value="page",required=false)int page,Contact contact,HttpServletResponse response, HttpServletRequest request){
		Pager<Contact> pager = new Pager<>();
		pager.setPageSize(10);
		int count = contactService.contactQueryCount();
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
		String i = contact.getMancom().toString();
		if(i != "0"){
			map.put("mancom", i);
		}else{
			map.put("mancom", null);
		}
		/*Map<String,Object> map=new HashMap<String,Object>();*/
		/*map.put("mancom", StringUtil.formatLike(contact.getMancom()+""));*/
		map.put("manname", StringUtil.formatLike(contact.getManname()));
		map.put("mandep", StringUtil.formatLike(contact.getMandep()));
		map.put("manjob", StringUtil.formatLike(contact.getManjob()));
		map.put("manmobile", StringUtil.formatLike(contact.getManmobile()));
		map.put("manskill", StringUtil.formatLike(contact.getManskill()));
		map.put("logdate", StringUtil.formatLike(contact.getLogdate()));
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Contact> userList=contactService.queryAll(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		List<Customer> listName=contactService.customerSelect();
		request.setAttribute("listName", listName);
		return "Contact/ContactManage";
	}
	
	/**
	 * 分页
	 * @param page
	 * @param contact
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contactQueryPagers")
	public String bespokeQueryAll(@RequestParam(value="page",required=false)int page,Contact contact,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<Contact> pager = new Pager<>();
		pager.setPageSize(10);
		int count = contactService.contactQueryCount();
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
		List<Contact> userList=contactService.queryAlls(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		List<Customer> listName=contactService.customerSelect();
		request.setAttribute("listName", listName);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String datetime = df.format(new Date());
		request.setAttribute("datetimes", datetime);
		return "Contact/ContactManage";
	}
	
	/**
	 * 删除联络
	 * @param page
	 * @param manid
	 * @param resp
	 * @param req
	 * @return
	 */
	@RequestMapping("/contactDelete")
	public String contactDelete(@RequestParam(value="page")int page,@RequestParam(value="manid") String manid, HttpServletResponse resp, HttpServletRequest req){
		try{
			manid = manid.replace(" ", "");
			String []idsStr=manid.split(",");
			for(int i=0;i<idsStr.length;i++){
				contactService.contactDelete(Integer.parseInt(idsStr[i]));
			}
			resp.sendRedirect("contactQueryPagers.do?page="+page);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	/**
	 * 修改联络1
	 * @param manid
	 * @param page
	 * @param req
	 * @return
	 */
	@RequestMapping("/contactUpdate")
	public String contactUpdate(@RequestParam(value="manid",required=false)String manid, @RequestParam(value="page",required=false)int page,HttpServletRequest req){
		try {
			manid = manid.replace(" ", "");
			System.out.println(245678);
			Contact contact = contactService.contactById(Integer.valueOf(manid));
			System.out.println(123456);
			req.setAttribute("contact", contact);
			req.setAttribute("page", page);
			List<Customer> listName=contactService.customerSelect();
			req.setAttribute("listName", listName);
			return "Contact/ContactUpdate";
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("InfoMessage", "信息修改失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	/**
	 * 修改联络2
	 * @param contact
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/contactUpdateqr")
	public String contactUpdateqr(Contact contact,HttpServletResponse response,HttpServletRequest request){
		try {			
			contactService.contactUpdate(contact);
			int page = Integer.valueOf(request.getParameter("page"));
			response.sendRedirect("contactQueryPagers.do?page="+page);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	/**
	 * 导出数据
	 * @param customer
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/daochu")
	public String daochu(Contact contact, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		cell.setCellValue("客户名称");
		cell.setCellStyle(style);
		cell = row.createCell((int) 3);
		cell.setCellValue("客户部门");
		cell.setCellStyle(style);
		cell = row.createCell((int) 4);
		cell.setCellValue("客户职位");
		cell.setCellStyle(style);
		cell = row.createCell((int) 5);
		cell.setCellValue("客户电话");
		cell.setCellStyle(style);
		cell = row.createCell((int) 6);
		cell.setCellValue("客户手机");
		cell.setCellStyle(style);
		cell = row.createCell((int) 7);
		cell.setCellValue("客户邮箱");
		cell.setCellStyle(style);
		cell = row.createCell((int) 8);
		cell.setCellValue("客户QQ");
		cell.setCellStyle(style);
		cell = row.createCell((int) 9);
		cell.setCellValue("客户MSN");
		cell.setCellStyle(style);
		cell = row.createCell((int) 10);
		cell.setCellValue("技术程度");
		cell.setCellStyle(style);
		cell = row.createCell((int) 11);
		cell.setCellValue("日志日期");
		cell.setCellStyle(style);
		Pager<Contact> pager = new Pager<>();
		pager.setPageNo(1);
		pager.setPageSize(100);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Contact> list = null;
		list = contactService.queryAlls(map);
		try {
			// 向单元格里填充数据
			for (short i = 0; i < list.size(); i++) {
				row = sheet.createRow(i + 1);
				row.createCell(0).setCellValue(list.get(i).getManid());
				row.createCell(1).setCellValue(list.get(i).getCustomers().getComname());
				row.createCell(2).setCellValue(list.get(i).getManname());
				row.createCell(3).setCellValue(list.get(i).getMandep());
				row.createCell(4).setCellValue(list.get(i).getManjob());
				row.createCell(5).setCellValue(list.get(i).getMannumber());
				row.createCell(6).setCellValue(list.get(i).getManmobile());
				row.createCell(7).setCellValue(list.get(i).getManemail());
				row.createCell(8).setCellValue(list.get(i).getManqq());
				row.createCell(9).setCellValue(list.get(i).getManmsn());
				row.createCell(10).setCellValue(list.get(i).getManskill());
				row.createCell(11).setCellValue(list.get(i).getLogdate());
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
			FileOutputStream out = new FileOutputStream("D:/导出文件/联络信息.xls");
			hwb.write(out);
			out.flush();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		response.sendRedirect("contactQueryPagers.do?page=" + 1);
		return null;
	}
	/**
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping("/quitLogin")
	public String quitLogin(HttpServletRequest req){
		HttpSession session = req.getSession();
		System.out.println("清除session："+session.getAttribute("user"));
		session.removeAttribute("user");
		return "login";
	}
	
}
