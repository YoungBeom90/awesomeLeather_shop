package com.awesomeLeather.client.list.dao;

import java.util.List;

import com.awesomeLeather.client.list.vo.ListVO;

public interface ListDAO {

	public List<ListVO> orderList(int o_num);
}
