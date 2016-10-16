package com.ht.bean;

import java.util.Date;
/**
 * 客户信息
 * @author LiuShengDong
 *
 */
public class Customer {
	private Integer kid; 		//客户ID
	private String comname;		//公司名称
	private String atype;		//申请类型
	private String combackdrop;	//公司背景
	private String comaddress;	//公司地址
	private String product;		//主营产品
	private String structure;	//组织结构
	private String testman;		//测试人
	private String amessage;	//申请信息
	private String state;		//客户状态
	private String newdate;		//新建时间
	private String designated;	//指派人
	
	
	public Integer getKid() {
		return kid;
	}
	public void setKid(Integer kid) {
		this.kid = kid;
	}
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
	public String getAtype() {
		return atype;
	}
	public void setAtype(String atype) {
		this.atype = atype;
	}
	public String getCombackdrop() {
		return combackdrop;
	}
	public void setCombackdrop(String combackdrop) {
		this.combackdrop = combackdrop;
	}
	public String getComaddress() {
		return comaddress;
	}
	public void setComaddress(String comaddress) {
		this.comaddress = comaddress;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getStructure() {
		return structure;
	}
	public void setStructure(String structure) {
		this.structure = structure;
	}
	public String getTestman() {
		return testman;
	}
	public void setTestman(String testman) {
		this.testman = testman;
	}
	public String getAmessage() {
		return amessage;
	}
	public void setAmessage(String amessage) {
		this.amessage = amessage;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getNewdate() {
		return newdate;
	}
	public void setNewdate(String newdate) {
		this.newdate = newdate;
	}
	public String getDesignated() {
		return designated;
	}
	public void setDesignated(String designated) {
		this.designated = designated;
	}
	
}
