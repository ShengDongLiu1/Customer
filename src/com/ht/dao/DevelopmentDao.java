package com.ht.dao;

import java.util.List;
import java.util.Map;

import com.ht.bean.Development;
import com.ht.bean.Marketing;

public interface DevelopmentDao {
	

	/**
	 * 查询客户开发计划集合
	 * @param map
	 * @return
	 */
	public List<Development> find(Map<String,Object> map);
	
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Integer getTotal();
	
	/**
	 * 修改客户开发计划
	 * @param cevelopment
	 * @return
	 */
	public int update(Development cevelopment);
	
	/**
	 * 添加客户开发计划
	 * @param cevelopment
	 * @return
	 */
	public int add(Development cevelopment);
	
	/**
	 * 删除客户开发计划
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	
	public Development findById(Integer id);
}
