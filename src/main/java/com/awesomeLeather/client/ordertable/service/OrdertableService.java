package com.awesomeLeather.client.ordertable.service;

import java.util.List;

import com.awesomeLeather.client.basket.vo.BasketVO;
import com.awesomeLeather.client.orderdetail.vo.OrderDetailVO;
import com.awesomeLeather.client.ordertable.vo.OrdertableVO;

public interface OrdertableService {
	public List<OrdertableVO> ordertableList(OrdertableVO ovo);
	public int deleteOrderList(int o_num);
	public int deleteOrdertable(int o_num);
	public OrdertableVO orderDetail(int o_num);
	public List<BasketVO> orderForm(List<BasketVO> bvo);
	public int orderInsert(BasketVO bvo);	
	public int orderInsertDetail(OrderDetailVO dvo);
	
}
