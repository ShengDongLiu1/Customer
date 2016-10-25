package com.ht.bean;
/**
 * 产品信息管理
 * @author LJP
 *
 */
public class Product {
	
	private Integer pid;        //产品id
	private String pname;       //产品名称
	private String pnumber;    //产品编号
	private String pstock;      //产品存货
	private Double pprice;      //产品价格
	private String ptype;       //产品类型
	private String state;		//产品状态类型
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getPstock() {
		return pstock;
	}
	public void setPstock(String pstock) {
		this.pstock = pstock;
	}
	public Double getPprice() {
		return pprice;
	}
	public void setPprice(Double pprice) {
		this.pprice = pprice;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", pnumber=" + pnumber + ", pstock=" + pstock + ", pprice="
				+ pprice + ", ptype=" + ptype + ", state=" + state + "]";
	}
	
}
