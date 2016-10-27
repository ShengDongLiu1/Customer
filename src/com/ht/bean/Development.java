package com.ht.bean;

//开发计划表
public class Development {

	private Integer id; // 编号
	private Marketing marketing; // 销售机会
	private String planItem; // 计划项
	private String planDate; // 计划日期
	private String exeAffect; // 执行效果

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Marketing getMarketing() {
		return marketing;
	}

	public void setMarketing(Marketing marketing) {
		this.marketing = marketing;
	}

	public String getPlanItem() {
		return planItem;
	}

	public void setPlanItem(String planItem) {
		this.planItem = planItem;
	}

	public String getPlanDate() {
		return planDate;
	}

	public void setPlanDate(String planDate) {
		this.planDate = planDate;
	}

	public String getExeAffect() {
		return exeAffect;
	}

	public void setExeAffect(String exeAffect) {
		this.exeAffect = exeAffect;
	}

}
