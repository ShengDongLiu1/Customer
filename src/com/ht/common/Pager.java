package com.ht.common;

import java.util.List;

import com.ht.bean.Bespoke;

public class Pager<T> {
	//当前页
	private int pageNo;
	//每页多少
	private int pageSize;
	//总页数
	private int total;
	//存放数据
	private List<T> rows;
	
	public int getBeginIndex(){
		return (pageNo - 1) * pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}


}
