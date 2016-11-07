package com.ht.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
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
	
	

	@RequestMapping("/queryById")
	public void queyById1(@RequestParam(value="userid")Integer id, HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/json");
		if(!id.equals("") && id!=null){
			User user = userService.UserSelect(id);
			writer.write(JSON.toJSONString(user));
		}
	}
	
	@RequestMapping("/UserQueryAll")
	public String UserQueryAll(@RequestParam(value="page",required=false)int page,User user,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<User> pager = new Pager<>();
		pager.setPageSize(10);
		pager.setPageNo(page);
		int count = userService.UserQueryCount();
		if (count > 0) {
		int total = count % pager.getPageSize() == 0 ? count / pager.getPageSize() : count / pager.getPageSize() +1;
		pager.setTotal(total);
		if(page >= 1 && page <= pager.getTotal()){
			pager.setPageNo(page);
		} else if (page < 1) {
			pager.setPageNo(1);
		} else if(pager.getTotal() == 0){
			pager.setPageNo(1);
		}else{
			pager.setPageNo(pager.getTotal());
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<User> userList=userService.UserQueryAll(map);
		pager.setRows(userList);
		}else{
			request.setAttribute("tishi", "tishi");
		}
		request.setAttribute("userList", pager);
		List<Integer> age=new ArrayList<Integer>();
		for (int i = 18; i < 50; i++) {
			age.add(i);
		}
		request.setAttribute("uage", age);
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
	
	@RequestMapping("/addqr1")
	public String add1(User user,HttpServletResponse response,HttpServletRequest request){
		try {	
			user.setPassword(AES.getInstance().encrypt(user.getPassword()));
			userService.UserAdd(user);
			List<Integer> age=new ArrayList<Integer>();
			for (int i = 18; i < 50; i++) {
				age.add(i);
			}
			request.setAttribute("uage", age);
			return "addUser";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
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
		} else if (page < 1) {
			pager.setPageNo(1);
		} else if(pager.getTotal() == 0){
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
	
	@RequestMapping("/daochu")
	public String daochu(User user,HttpServletRequest request,HttpServletResponse response) throws Exception{
		// 声明一个工作薄
       HSSFWorkbook hwb = new HSSFWorkbook();
       //声明一个单子并命名
       HSSFSheet sheet = hwb.createSheet("用户表");
       //给单子名称一个长度
       sheet.setDefaultColumnWidth((int)15);
       // 生成一个样式  
       HSSFCellStyle style = hwb.createCellStyle();
       //创建第一行（也可以称为表头）
       HSSFRow row = sheet.createRow(0);
       //样式字体居中
       style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
       //给表头第一行一次创建单元格
       HSSFCell cell = row.createCell((int) 0);
       cell.setCellValue("用户编号");
       cell.setCellStyle(style); 
       cell = row.createCell((int) 1);
       cell.setCellValue("账号");
       cell.setCellStyle(style);
       cell = row.createCell((int) 2);
       cell.setCellValue("用户状态");
       cell.setCellStyle(style);
       cell = row.createCell((int) 3);
       cell.setCellValue("用户名");
       cell.setCellStyle(style);
       cell = row.createCell((int) 4);
       cell.setCellValue("性别");
       cell.setCellStyle(style);
       cell = row.createCell((int) 5);
       cell.setCellValue("联系电话");
       cell.setCellStyle(style);
       cell = row.createCell((int) 6);
       cell.setCellValue("年龄");
       
       Pager<User> pager = new Pager<>();
		pager.setPageNo(1);
		pager.setPageSize(100);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<User> list = null;
	  	list = userService.find(map);
        try{
	          //向单元格里填充数据
			for (short i = 0; i < list.size(); i++) {
				row = sheet.createRow(i + 1);
				row.createCell(0).setCellValue(list.get(i).getUserid());
				row.createCell(1).setCellValue(list.get(i).getEmail());
				row.createCell(2).setCellValue(list.get(i).getStatus());
				row.createCell(3).setCellValue(list.get(i).getUname());
				row.createCell(4).setCellValue(list.get(i).getUsex());
				row.createCell(5).setCellValue(list.get(i).getUnumber());
				row.createCell(6).setCellValue(list.get(i).getUage());
			}
        }catch(NullPointerException e){
        	e.printStackTrace();
        }
       try {  
    	   File file = new File("D:/导出文件");
    	   if(file.exists() == false){
    		   file.mkdir();
    	   }
    	   /*导出的数据放在d盘的 导出文件 的文件夹里*/
           FileOutputStream out = new FileOutputStream("D:/导出文件/用户表.xls");
           hwb.write(out);
           out.flush();
           out.close();
       } catch (FileNotFoundException e) {
           e.printStackTrace();
       }
     
        response.sendRedirect("UserQueryAll.do?page=1");
		return null;
	}
}
