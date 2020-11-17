package com.awesomeLeather.client.ordertable.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.awesomeLeather.client.basket.vo.BasketVO;
import com.awesomeLeather.client.orderdetail.vo.OrderDetailVO;
import com.awesomeLeather.client.ordertable.dao.OrdertableDAO;
import com.awesomeLeather.client.ordertable.vo.OrdertableVO;

import lombok.Setter;

@Service
public class OrdertableServiceImpl implements OrdertableService{
	
	@Setter(onMethod_=@Autowired)
	private OrdertableDAO ordertableDAO;

	@Override
	public List<OrdertableVO> ordertableList(OrdertableVO ovo) {
		List<OrdertableVO> list = null;
		list = ordertableDAO.ordertableList(ovo);
		return list;
	}

	@Override
	public int deleteOrderList(int o_num) {
		int result = ordertableDAO.deleteOrderList(o_num);
		return result;
	}

	@Override
	public int deleteOrdertable(int o_num) {
		int result = ordertableDAO.deleteOrdertable(o_num);		
		return result;
	}

	@Override
	public OrdertableVO orderDetail(int o_num) {
		OrdertableVO ovo = ordertableDAO.orderDetail(o_num);
		return ovo;
	}

	@Override
	public List<BasketVO> orderForm( List<BasketVO> vo) {
		List<BasketVO> list = new ArrayList<BasketVO>();
		
		for(int i=0; i<vo.size();i++) {
			BasketVO bbvo = vo.get(i);
			BasketVO bvo = ordertableDAO.orderForm(bbvo);
			list.add(bvo);
			
		}
		for(BasketVO vo1 : list) {
			System.out.println(vo1);
		}
		//List<BasketVO> bvo = ordertableDAO.orderForm(vo);
		return list;
	}

	@Override
	public int orderInsert(BasketVO bvo) {
		int result = ordertableDAO.orderInsert(bvo);
		return result;
	}

	@Override
	public int orderInsertDetail(OrderDetailVO dvo) {
		int result = ordertableDAO.orderInsertDetail(dvo);
		return result;
	}

}
