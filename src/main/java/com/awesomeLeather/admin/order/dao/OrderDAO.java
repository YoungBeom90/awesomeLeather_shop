package com.awesomeLeather.admin.order.dao;

import java.util.List;

import com.awesomeLeather.admin.list.vo.OrderListVO;
import com.awesomeLeather.admin.order.vo.OrderVO;

public interface OrderDAO {
	public List<OrderVO> orderList(OrderVO ovo);
	
	public List<OrderListVO> orderDetail(OrderVO ovo);
	
	public int statePayUpdate(OrderVO ovo);
	
	public int stateDeliUpdate(OrderVO ovo);
	
	public int stateCancelUpdate(OrderVO ovo);
}
