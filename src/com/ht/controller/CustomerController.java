package com.ht.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.ht.bean.Customer;
import com.ht.bean.User;
import com.ht.common.Pager;
import com.ht.common.StringUtil;
import com.ht.service.CustomerService;
import com.ht.service.UserService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Resource
	private CustomerService customerService;
	
	@Resource
	private UserService userService;

	@RequestMapping("/crsselect")
	public String crsselect(@RequestParam(value="kid",required=false)Integer kid,HttpServletResponse response,HttpServletRequest request)throws Exception{
		System.out.println("adssdsa");
		System.out.println(1);
		Customer crs = customerService.csrselect(1);
		List<Customer> list = new ArrayList<>();
		list.add(crs);
		System.out.println(crs.getComname());
		request.setAttribute("lists", list);
		return "customer";
	}
	
	@RequestMapping("/queryAll")
	public String list2(@RequestParam(value="page",required=false)int page,Customer customer,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<Customer> pager = new Pager<>();
		pager.setPageSize(10);
		int count = customerService.queryCount();
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
		map.put("comname", StringUtil.formatLike(customer.getComname()));
		map.put("atype", StringUtil.formatLike(customer.getAtype()));
		map.put("comaddress", StringUtil.formatLike(customer.getComaddress()));
		map.put("product", StringUtil.formatLike(customer.getProduct()));
		map.put("testman", StringUtil.formatLike(customer.getTestman()));
		map.put("state", StringUtil.formatLike(customer.getState()));
		map.put("designated", StringUtil.formatLike(customer.getDesignated()));
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Customer> userList=customerService.queryAll(map);
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		return "customer";
	}
	
	
	//潜在客户
	@RequestMapping("/queryState")
	public String queryState(@RequestParam(value="page",required=false)int page,@RequestParam(value="state",required=false)int state,Customer customer,HttpServletResponse response, HttpServletRequest request)throws Exception{
		System.out.println("客户状态:"+state);
		List<Customer> userList = null;
		Pager<Customer> pager = new Pager<>();
		pager.setPageSize(10);
		int count = customerService.queryCount();
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
		if(state==1){
			 customer.setState("潜在客户");
			 map.put("state", customer.getState());
			 userList=customerService.selectState(map);
			 request.setAttribute("state", state);
		}else if(state==2){
			 customer.setState("正式客户");
			 map.put("state", customer.getState());
			 userList=customerService.selectState(map);
			 request.setAttribute("state", state);
		}
		else if(state==3){
			 customer.setState("放弃客户");
			 map.put("state", customer.getState());
			 userList=customerService.selectState(map);
			 request.setAttribute("state", state);
		}else if(state==4){
			 customer.setState("签约客户");
			 map.put("state", customer.getState());
			 userList=customerService.selectState(map);
			 request.setAttribute("state", state);
		}else{
			 userList = customerService.queryAll(map);
			 request.setAttribute("state", state);
		}
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		return "customer";
	}

	@RequestMapping("/update")
	public String update(@RequestParam(value="kid",required=false)String kid ,@RequestParam(value="state",required=false)int state ,
			@RequestParam(value="page",required=false)int page,HttpServletRequest request)throws Exception{
		try {
			kid = kid.replace(" ", "");
		    Customer customer = customerService.csrselect(Integer.valueOf(kid));
			request.setAttribute("customer", customer);
			request.setAttribute("page", page);
			request.setAttribute("state", state);
			List<User> userName = userService.UserNameQueryAll();
			request.setAttribute("userName", userName);
			return "updatecustomer";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("/updateqr")
	public String update(Customer customer,HttpServletResponse response,HttpServletRequest request){
		try {	
			Integer state1 = Integer.valueOf(request.getParameter("state1"));
			customerService.csrcupdate(customer);
			int page = Integer.valueOf(request.getParameter("page"));
			response.sendRedirect("queryState.do?page="+page+"&state="+state1);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/updatestate")
	public String updatestate(@RequestParam(value="kid",required=false)String kid,HttpServletResponse response,HttpServletRequest request){
		try {	
			Customer customer = new Customer();
			String state = request.getParameter("state");
			kid = kid.replace(" ", "");
			String []idsStr=kid.split(",");
			 for(int i=0;i<idsStr.length;i++){
				 customer.setKid(Integer.valueOf(idsStr[i]));
				 customer.setState(state);
				 customerService.csrcupdate(customer);
			 }
			Integer state1 = Integer.valueOf(request.getParameter("state1"));
			int page = Integer.valueOf(request.getParameter("page"));
			response.sendRedirect("queryState.do?page="+page+"&state="+state1);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="page",required=false)int page,@RequestParam(value="kid",required=false)String kid,HttpServletResponse response,HttpServletRequest request){
		try {	
			kid = kid.replace(" ", "");//替换
			String []idsStr=kid.split(",");//拆分
		 for(int i=0;i<idsStr.length;i++){
			 customerService.csrdelete(Integer.parseInt(idsStr[i]));
		 }
		 Integer state1 = Integer.valueOf(request.getParameter("state1"));
		 response.sendRedirect("queryState.do?page="+page+"&state="+state1);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest req){
		List<User> userName = userService.UserNameQueryAll();
		req.setAttribute("userName", userName);
		return "addcustomer";
	}
	

	@RequestMapping("/addqr")
	public String addqr(Customer customer,HttpServletResponse response,HttpServletRequest request){
		try {	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss ");  
			customer.setNewdate(sdf.format(new Date()));
			customerService.cadd(customer);
			response.sendRedirect("queryState.do?page=1&state=5");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	
	@RequestMapping("/daochu")
	public String daochu(Customer customer,HttpServletRequest request,HttpServletResponse response) throws Exception{
		// 声明一个工作薄
       HSSFWorkbook hwb = new HSSFWorkbook();
       //声明一个单子并命名
       HSSFSheet sheet = hwb.createSheet("客户表");
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
       cell.setCellValue("编号");
       cell.setCellStyle(style); 
       cell = row.createCell((int) 1);
       cell.setCellValue("公司名称");
       cell.setCellStyle(style);
       cell = row.createCell((int) 2);
       cell.setCellValue("申请类型");
       cell.setCellStyle(style);
       cell = row.createCell((int) 3);
       cell.setCellValue("公司背景");
       cell.setCellStyle(style);
       cell = row.createCell((int) 4);
       cell.setCellValue("公司地址");
       cell.setCellStyle(style);
       cell = row.createCell((int) 5);
       cell.setCellValue("主营产品");
       cell.setCellStyle(style);
       cell = row.createCell((int) 6);
       cell.setCellValue("测试人");
       cell.setCellStyle(style);
       cell = row.createCell((int) 7);
       cell.setCellValue("申请信息");
       cell.setCellStyle(style);
       cell = row.createCell((int) 8);
       cell.setCellValue("客户状态");
       cell.setCellStyle(style);
       cell = row.createCell((int) 9);
       cell.setCellValue("新建时间");
       cell.setCellStyle(style);
       cell = row.createCell((int) 10);
       cell.setCellValue("指派人");
       cell.setCellStyle(style);
       Pager<Customer> pager = new Pager<>();
		pager.setPageNo(1);
		pager.setPageSize(100);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Customer> list = null;
	  	Integer state = Integer.valueOf(request.getParameter("state"));
		if(state==1){
			 customer.setState("潜在客户");
			 map.put("state", customer.getState());
			 list=customerService.selectState(map);
		}else if(state==2){
			 customer.setState("正式客户");
			 map.put("state", customer.getState());
			 list=customerService.selectState(map);
		}
		else if(state==3){
			 customer.setState("放弃客户");
			 map.put("state", customer.getState());
			 list=customerService.selectState(map);
		}else if(state==4){
			 customer.setState("签约客户");
			 map.put("state", customer.getState());
			 list=customerService.selectState(map);
		}else{
			 list = customerService.queryAll(map);
		}
        try{
	          //向单元格里填充数据
			for (short i = 0; i < list.size(); i++) {
				row = sheet.createRow(i + 1);
				row.createCell(0).setCellValue(list.get(i).getKid());
				row.createCell(1).setCellValue(list.get(i).getComname());
				row.createCell(2).setCellValue(list.get(i).getAtype());
				row.createCell(3).setCellValue(list.get(i).getCombackdrop());
				row.createCell(4).setCellValue(list.get(i).getComaddress());
				row.createCell(5).setCellValue(list.get(i).getProduct());
				row.createCell(6).setCellValue(list.get(i).getTestman());
				row.createCell(7).setCellValue(list.get(i).getAmessage());
				row.createCell(8).setCellValue(list.get(i).getState());
				row.createCell(9).setCellValue(list.get(i).getNewdate());
				row.createCell(10).setCellValue(list.get(i).getDesignated());
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
           FileOutputStream out = new FileOutputStream("D:/导出文件/客户信息-"+customer.getState()+".xls");
           hwb.write(out);
           out.flush();
           out.close();
       } catch (FileNotFoundException e) {
           e.printStackTrace();
       }
     
        response.sendRedirect("queryState.do?page="+1+"&state="+state);
		return null;
	}
	
}
