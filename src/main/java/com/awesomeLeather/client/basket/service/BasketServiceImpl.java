package com.awesomeLeather.client.basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.awesomeLeather.admin.customer.vo.AdminCustomerVO;
import com.awesomeLeather.client.basket.dao.BasketDAO;
import com.awesomeLeather.client.basket.vo.BasketVO;

import lombok.Setter;

@Service
public class BasketServiceImpl implements BasketService {

	@Setter(onMethod_=@Autowired)
	private BasketDAO basketDAO;
	
	@Override
	public List<BasketVO> basketList(int c_num) {
		List<BasketVO> list = basketDAO.basketList(c_num);
		return list;
	}
	
	

	@Override
	public int basketInsert(BasketVO bvo) {
		int result = basketDAO.basketInsert(bvo);
		return result;
	}

}
