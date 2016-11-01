package com.ht.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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

import com.alibaba.fastjson.JSON;
import com.ht.bean.Customer;
import com.ht.bean.Marketing;
import com.ht.bean.User;
import com.ht.common.Pager;
import com.ht.common.StringUtil;
import com.ht.service.MarketingService;

@Controller
@RequestMapping("marketing")
public class MarketingController {
	
	@Resource
	private MarketingService marketingService;
	
	@RequestMapping("/queryById")
	public void queyById1(@RequestParam(value="id")Integer id, HttpServletRequest request, HttpServletResponse response) throws IOException{
		/*Integer id = Integer.valueOf(request.getParameter("id"));*/
		PrintWriter writer = response.getWriter();
		response.setContentType("text/json");
		if(!id.equals("") && id!=null){
			Marketing marketing = marketingService.findById(id);
			writer.write(JSON.toJSONString(marketing));
		}
	}
	
	@RequestMapping("/queryAll")
	public String list2(@RequestParam(value="page",required=false)int page,Marketing marketing,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<Marketing> pager = new Pager<>();
		pager.setPageSize(10);
		int count = marketingService.getTotal();
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
		map.put("customerName", StringUtil.formatLike(marketing.getCustomerName()));
		map.put("linkMan", StringUtil.formatLike(marketing.getLinkMan()));
		map.put("createMan", StringUtil.formatLike(marketing.getCreateMan()));
		map.put("assignMan", marketing.getAssignMan());
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Marketing> userList=marketingService.find(map);
		List<User> userName = marketingService.selectUserName();
		List<Customer> CustomerName = marketingService.selectCustomerName();
		pager.setRows(userList);
		request.setAttribute("lists", pager);
		request.setAttribute("userName", userName);
		request.setAttribute("CustomerName", CustomerName);
		return "marketing";
	}
	
	@RequestMapping("addqr")
	public String addMarketing(Marketing marketing, HttpServletResponse resp,HttpServletRequest request){
		try{
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			marketing.setCreateTime(df.format(new Date()));// new Date()为获取当前系统时间
			if(marketing.getAssignMan()!=null && !marketing.getAssignMan().equals("")){
				marketing.setState(1);
			}
			marketing.setDevResult(0);
			marketingService.add(marketing);
			resp.sendRedirect("queryAll.do?page=1");
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
		
	}
	
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="page",required=false)int page,@RequestParam(value="id",required=false)String kid,HttpServletResponse response,HttpServletRequest request){
		try {	
			kid = kid.replace(" ", "");//替换
			String []idsStr=kid.split(",");//拆分
		 for(int i=0;i<idsStr.length;i++){
			 marketingService.delete(Integer.parseInt(idsStr[i]));
		 }
		 response.sendRedirect("queryAll.do?page="+page);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	
	@RequestMapping("/updateqr")
	public String update(Marketing marketing,HttpServletResponse response,HttpServletRequest request){
		try {	
			if(marketing.getAssignMan()!=null && !marketing.getAssignMan().equals("")){
				marketing.setState(1);
			}
			marketingService.update(marketing);
			response.sendRedirect("queryAll.do?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	
	@RequestMapping("/daochu")
	public String daochu(Marketing marketing,HttpServletRequest request,HttpServletResponse response) throws Exception{
		// 声明一个工作薄
       HSSFWorkbook hwb = new HSSFWorkbook();
       //声明一个单子并命名
       HSSFSheet sheet = hwb.createSheet("营销机会表");
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
       cell.setCellValue("机会来源");
       cell.setCellStyle(style);
       cell = row.createCell((int) 3);
       cell.setCellValue("概要");
       cell.setCellStyle(style);
       cell = row.createCell((int) 4);
       cell.setCellValue("联系人");
       cell.setCellStyle(style);
       cell = row.createCell((int) 5);
       cell.setCellValue("联系人电话");
       cell.setCellStyle(style);
       cell = row.createCell((int) 6);
       cell.setCellValue("机会描述");
       cell.setCellStyle(style);
       cell = row.createCell((int) 7);
       cell.setCellValue("创建人");
       cell.setCellStyle(style);
       cell = row.createCell((int) 8);
       cell.setCellValue("创建时间");
       cell.setCellStyle(style);
       cell = row.createCell((int) 9);
       cell.setCellValue("指派人");
       cell.setCellStyle(style);
       Pager<Customer> pager = new Pager<>();
		pager.setPageNo(1);
		pager.setPageSize(100);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Marketing> list = null;
	  	list = marketingService.find(map);
        try{
	          //向单元格里填充数据
			for (short i = 0; i < list.size(); i++) {
				row = sheet.createRow(i + 1);
				row.createCell(0).setCellValue(list.get(i).getId());
				row.createCell(1).setCellValue(list.get(i).getCustomers().getComname());
				row.createCell(2).setCellValue(list.get(i).getChanceSource());
				row.createCell(3).setCellValue(list.get(i).getOverView());
				row.createCell(4).setCellValue(list.get(i).getLinkMan());
				row.createCell(5).setCellValue(list.get(i).getLinkPhone());
				row.createCell(6).setCellValue(list.get(i).getDescription());
				row.createCell(7).setCellValue(list.get(i).getCreateMan());
				row.createCell(8).setCellValue(list.get(i).getCreateTime());
				row.createCell(9).setCellValue(list.get(i).getUsers().getUname());
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
           FileOutputStream out = new FileOutputStream("D:/导出文件/营销机会表.xls");
           hwb.write(out);
           out.flush();
           out.close();
       } catch (FileNotFoundException e) {
           e.printStackTrace();
       }
     
        response.sendRedirect("queryAll.do?page="+1);
		return null;
	}
	
	
	
	
	
}
