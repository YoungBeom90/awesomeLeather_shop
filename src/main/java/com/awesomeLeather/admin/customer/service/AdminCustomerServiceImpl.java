package com.awesomeLeather.admin.customer.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.awesomeLeather.admin.customer.dao.AdminCustomerDAO;
import com.awesomeLeather.admin.customer.vo.AdminCustomerVO;
import com.awesomeLeather.client.list.vo.ListVO;
import com.awesomeLeather.client.ordertable.vo.OrdertableVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminCustomerServiceImpl implements AdminCustomerService {

	@Setter(onMethod_=@Autowired)
	private AdminCustomerDAO adminCustomerDAO;
	
	// 회원 목록 구현
	@Override
	public List<AdminCustomerVO> adminCustomerList(AdminCustomerVO cvo) {
		List<AdminCustomerVO> list = null;
		list = adminCustomerDAO.adminCustomerList(cvo);
		return list;
	}
	
	// 회원 상세 페이지
	@Override
	public AdminCustomerVO adminCustomerDetail(AdminCustomerVO cvo) {
		AdminCustomerVO detail = null;
		detail = adminCustomerDAO.adminCustomerDetail(cvo);		
		return detail;
	}

	@Override
	public int customerDeleteCheck(int c_num) {
		int result = adminCustomerDAO.customerDeleteCheck(c_num);
		return result;
	}

	@Override
	public int customerDelete(AdminCustomerVO cvo) {
		int result = adminCustomerDAO.customerDelete(cvo);
		return result;
	}

	@Override
	public int customerDeleteName(AdminCustomerVO cvo) {
		int result = adminCustomerDAO.customerDeleteName(cvo);
		return result;
	}

	@Override
	public List<ListVO> adminOrderList(AdminCustomerVO cvo) {
		List<ListVO> list = adminCustomerDAO.adminOrderList(cvo);
		log.info("service list : " + list);
		return list;
	}

}