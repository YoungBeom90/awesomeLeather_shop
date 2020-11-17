package com.awesomeLeather.admin.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.awesomeLeather.admin.list.vo.OrderListVO;
import com.awesomeLeather.admin.order.dao.OrderDAO;
import com.awesomeLeather.admin.order.vo.OrderVO;

import lombok.Setter;


@Service
public class OrderServiceImpl implements OrderService {
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDAO;

	@Override
	public List<OrderVO> orderList(OrderVO ovo) {
		List<OrderVO> list = orderDAO.orderList(ovo);
		return list;
	}

	@Override
	public List<OrderListVO> orderDetail(OrderVO ovo) {
		List<OrderListVO> detail = null;
		detail = orderDAO.orderDetail(ovo);
		return detail;
	}
	@Override
	public int statePayUpdate(OrderVO ovo) {
		int result = 0;
		result = orderDAO.statePayUpdate(ovo);
		return result;
	}

	@Override
	public int stateDeliUpdate(OrderVO ovo) {
		int result = 0;
		result = orderDAO.stateDeliUpdate(ovo);
		return result;
	}

	@Override
	public int stateCancelUpdate(OrderVO ovo) {
		int result = 0;
		result = orderDAO.stateCancelUpdate(ovo);
		return result;
	}


}
