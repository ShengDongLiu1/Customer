package com.ht.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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

import com.ht.bean.Bespoke;
import com.ht.bean.Customer;
import com.ht.bean.Marketing;
import com.ht.common.Pager;
import com.ht.common.StringUtil;
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
		List<Customer> listName=bespokeService.CustomerSelectName();
		request.setAttribute("listName", listName);
		request.setAttribute("bes", bes);
		return "updateBespoke";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	@RequestMapping("/bespokeQueryAlls")
	public String bespokeQueryAll(@RequestParam(value="page",required=false)int page,Bespoke bespoke,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<Bespoke> pager = new Pager<>();
		pager.setPageSize(10);
		pager.setPageNo(page);
		int count = bespokeService.BespokeQueryCount();
		if(count>0){
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
			List<Bespoke> userList=bespokeService.BespokeQueryAlls(map);
			pager.setRows(userList);
		}else{
			request.setAttribute("tishi", "tishi");
		}
		List<Customer> listName=bespokeService.CustomerSelectName();
		request.setAttribute("listName", listName);
		request.setAttribute("beslist", pager);
		return "bespoke";
	}
	
	@RequestMapping("/update")
	public String update(@RequestParam(value="bepid",required=false)String bepid ,HttpServletRequest request)throws Exception{
		try {			
			Bespoke bespoke = bespokeService.BespokeSelect(Integer.valueOf(bepid));
			request.setAttribute("bespoke", bespoke);
			List<Customer> listName=bespokeService.CustomerSelectName();
			System.out.println(listName+"-----");
			request.setAttribute("listName", listName);
			return "updateBespoke";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("/updateqr")
	public String update(Bespoke bespoke,HttpServletResponse response,HttpServletRequest request){
		try {			
			bespokeService.BespokeUpdate(bespoke);
			response.sendRedirect("bespokeQueryAlls.do?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="bepid",required=false)String bepid,HttpServletResponse response,HttpServletRequest request){
		try {			
			bespokeService.BespokeDelete(Integer.valueOf(bepid));
			response.sendRedirect("bespokeQueryAlls.do?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	@RequestMapping("/addqr")
	public String add(Bespoke bespoke,HttpServletResponse response,HttpServletRequest request){
		try {	
			bespokeService.BespokeAdd(bespoke);
			response.sendRedirect("bespokeQueryAlls.do?page=1");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
		return null;
	}
	
	@RequestMapping("/addqr1")
	public String add1(Bespoke bespoke,HttpServletResponse response,HttpServletRequest request){
		try {	
			bespokeService.BespokeAdd(bespoke);
			List<Customer> listName=bespokeService.CustomerSelectName();
			request.setAttribute("listName", listName);
			return "addBespoke";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	
	@RequestMapping("/add")
	public String add(HttpServletResponse response,HttpServletRequest request){	
		List<Customer> listName=bespokeService.CustomerSelectName();
		request.setAttribute("listName", listName);
		return "addBespoke";
	}
	
	@RequestMapping("bespokeQueryAll")
	public String queryAll(@RequestParam(value="page",required=false)int page,Bespoke bespoke,HttpServletResponse response, HttpServletRequest request)throws Exception{
		Pager<Bespoke> pager = new Pager<>();
		pager.setPageSize(10);
		int count = bespokeService.BespokeQueryCount();
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
		String i = bespoke.getBepcom().toString();
		if(i != "0"){
			map.put("bepcom", i);
		}else{
			map.put("bepcom", null);
		}
			
		map.put("bepman", StringUtil.formatLike(bespoke.getBepman()));
		map.put("bepaddress", StringUtil.formatLike(bespoke.getBepaddress()));
		map.put("beptype", StringUtil.formatLike(bespoke.getBeptype()));
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Bespoke> userList=bespokeService.BespokeQueryAll(map);
		pager.setRows(userList);
		List<Customer> listName=bespokeService.CustomerSelectName();
		request.setAttribute("listName", listName);
		request.setAttribute("beslist", pager);
		return "bespoke";
	}
	
	@RequestMapping("/daochu")
	public String daochu(Bespoke bespoke,HttpServletRequest request,HttpServletResponse response) throws Exception{
		// 声明一个工作薄
       HSSFWorkbook hwb = new HSSFWorkbook();
       //声明一个单子并命名
       HSSFSheet sheet = hwb.createSheet("预定管理表");
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
       cell.setCellValue("预约编号");
       cell.setCellStyle(style); 
       cell = row.createCell((int) 1);
       cell.setCellValue("预约公司名称");
       cell.setCellStyle(style);
       cell = row.createCell((int) 2);
       cell.setCellValue("预约人");
       cell.setCellStyle(style);
       cell = row.createCell((int) 3);
       cell.setCellValue("预约地址");
       cell.setCellStyle(style);
       cell = row.createCell((int) 4);
       cell.setCellValue("预约时间");
       cell.setCellStyle(style);
       cell = row.createCell((int) 5);
       cell.setCellValue("预约类型");
       
       
       Pager<Bespoke> pager = new Pager<>();
		pager.setPageNo(1);
		pager.setPageSize(100);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Bespoke> list = null;
	  	list = bespokeService.find(map);
        try{
	          //向单元格里填充数据
			for (short i = 0; i < list.size(); i++) {
				row = sheet.createRow(i + 1);
				row.createCell(0).setCellValue(list.get(i).getBepid());
				row.createCell(1).setCellValue(list.get(i).getCustomer().getComname());
				row.createCell(2).setCellValue(list.get(i).getBepman());
				row.createCell(3).setCellValue(list.get(i).getBepaddress());
				row.createCell(4).setCellValue(list.get(i).getBepdate());
				row.createCell(5).setCellValue(list.get(i).getBeptype());
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
           FileOutputStream out = new FileOutputStream("D:/导出文件/预约管理表.xls");
           hwb.write(out);
           out.flush();
           out.close();
       } catch (FileNotFoundException e) {
           e.printStackTrace();
       }
     
        response.sendRedirect("bespokeQueryAlls.do?page=1");
		return null;
	}
}
