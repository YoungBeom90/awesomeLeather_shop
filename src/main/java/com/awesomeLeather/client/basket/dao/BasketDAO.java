package com.awesomeLeather.client.basket.dao;


import java.util.List;

import com.awesomeLeather.client.basket.vo.BasketVO;

public interface BasketDAO {
	public List<BasketVO> basketList(int c_num);

	public int basketInsert(BasketVO bvo);
}
