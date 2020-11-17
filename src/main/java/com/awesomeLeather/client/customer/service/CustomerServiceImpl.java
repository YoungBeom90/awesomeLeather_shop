package com.awesomeLeather.client.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.awesomeLeather.client.customer.dao.CustomerDAO;
import com.awesomeLeather.client.customer.vo.CustomerVO;

import lombok.Setter;
@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Setter(onMethod_ = @Autowired )
	private CustomerDAO customerDAO;

	//회원가입구현
	@Override
	public int customerInsert(CustomerVO cvo) {
		int result = 0;
		result = customerDAO.customerInsert(cvo);
		return result;
	}

	//로그인 정보 확인 구현
	@Override
	public int loginCheck(CustomerVO cvo) {
		int result = 0;
		result = customerDAO.loginCheck(cvo);
		return result;
	}

	@Override
	public int customerUpdate(CustomerVO cvo) {
		int result = 0;
		result = customerDAO.customerUpdate(cvo);
		return result;
	}

	@Override
	public int idCheck(CustomerVO cvo) {
		int result = 0;
		result = customerDAO.idCheck(cvo);
		return result;
	}
	
	public CustomerVO login(CustomerVO vo) {
		CustomerVO cvo = customerDAO.login(vo);
		return cvo;
	}

	@Override
	public CustomerVO updateList(CustomerVO vo) {
		CustomerVO cvo = customerDAO.updateList(vo);
		return cvo;
	}

}
