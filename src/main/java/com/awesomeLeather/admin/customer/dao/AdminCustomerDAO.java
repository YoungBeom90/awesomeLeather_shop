package com.awesomeLeather.admin.customer.dao;

import java.util.List;

import com.awesomeLeather.admin.customer.vo.AdminCustomerVO;
import com.awesomeLeather.client.list.vo.ListVO;
import com.awesomeLeather.client.ordertable.vo.OrdertableVO;

public interface AdminCustomerDAO {
	public List<AdminCustomerVO> adminCustomerList(AdminCustomerVO cvo);
	public List<ListVO> adminOrderList(AdminCustomerVO cvo);
	public AdminCustomerVO adminCustomerDetail(AdminCustomerVO cvo);	
	public int customerDeleteCheck(int c_num);
	public int customerDelete(AdminCustomerVO cvo);
	public int customerDeleteName(AdminCustomerVO cvo);
}
