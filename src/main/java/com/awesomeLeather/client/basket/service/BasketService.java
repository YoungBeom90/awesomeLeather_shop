package com.awesomeLeather.client.basket.service;

import java.util.List;

import com.awesomeLeather.client.basket.vo.BasketVO;

public interface BasketService {
	
	public List<BasketVO> basketList(int c_num);
	public int basketInsert(BasketVO bvo );

}
