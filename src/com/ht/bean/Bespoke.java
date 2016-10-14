package com.ht.bean;

public class Bespoke {
	
	private Integer bepid;		//预约id
	private Integer bepcom;		//预约公司 关联客户ID
	private String bepman;		//预约人
	private String bepaddress;	//预约地址
	private String bepdate;		//预约时间
	private String beptype;		//预约类型
	
	public Integer getBepid() {
		return bepid;
	}
	public void setBepid(Integer bepid) {
		this.bepid = bepid;
	}
	public Integer getBepcom() {
		return bepcom;
	}
	public void setBepcom(Integer bepcom) {
		this.bepcom = bepcom;
	}
	public String getBepman() {
		return bepman;
	}
	public void setBepman(String bepman) {
		this.bepman = bepman;
	}
	public String getBepaddress() {
		return bepaddress;
	}
	public void setBepaddress(String bepaddress) {
		this.bepaddress = bepaddress;
	}
	public String getBepdate() {
		return bepdate;
	}
	public void setBepdate(String bepdate) {
		this.bepdate = bepdate;
	}
	public String getBeptype() {
		return beptype;
	}
	public void setBeptype(String beptype) {
		this.beptype = beptype;
	}
	
	
}
