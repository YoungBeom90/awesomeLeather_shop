package com.awesomeLeather.client.list.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.awesomeLeather.client.list.dao.ListDAO;
import com.awesomeLeather.client.list.vo.ListVO;

import lombok.Setter;

@Service
public class ListServiceImpl implements ListService{

	@Setter(onMethod_=@Autowired)
	private ListDAO listDAO;

	@Override
	public List<ListVO> orderList(int o_num) {
		List<ListVO> list = null;
		list = listDAO.orderList(o_num);
		return list;
	}
	
	

}
