package com.awesomeLeather.client.customer.dao;

import com.awesomeLeather.client.customer.vo.CustomerVO;

public interface CustomerDAO {

	public int customerInsert(CustomerVO cvo);
	
	public int loginCheck(CustomerVO cvo);
	
	public int customerUpdate(CustomerVO cvo);
	
	public int idCheck(CustomerVO cvo);
	
	public CustomerVO login(CustomerVO cvo);
	public CustomerVO updateList(CustomerVO cvo);
}
