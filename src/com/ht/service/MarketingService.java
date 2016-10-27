package com.ht.service;

import java.util.List;
import java.util.Map;

import com.ht.bean.User;

import com.ht.bean.Customer;
import com.ht.bean.Marketing;

public interface MarketingService {
	
	/**
	 * 查询销售机会集合
	 * @param map
	 * @return
	 */
	public List<Marketing> find(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Integer getTotal();
	
	/**
	 * 添加销售机会
	 * @param marketing
	 * @return
	 */
	public int add(Marketing marketing);
	
	/**
	 * 修改销售机会
	 * @param marketing
	 * @return
	 */
	public int update(Marketing marketing);

	/**
	 * 删除销售机会
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Marketing findById(Integer id);
	
	
public List<Customer> selectCustomerName();
	
	public List<User>selectUserName();
}
