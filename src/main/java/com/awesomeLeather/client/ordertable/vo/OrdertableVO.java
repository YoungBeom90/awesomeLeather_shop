package com.awesomeLeather.client.ordertable.vo;

import java.util.ArrayList;
import java.util.List;

import com.awesomeLeather.client.basket.vo.BasketVO;

import lombok.Data;

@Data
public class OrdertableVO {
	
	private int o_num;
	private int o_state;
	private String o_date;
	private int c_num;
	private String o_pay;
	private String o_name;
	private String o_phone;
	private String o_address1;
	private String o_address2;
	private String o_address3;
	private String o_address4;
	private String i_image;
	private int p_num;
	private String l_name;
	private String l_color;
	private String l_size;
	private int l_cnt;
	private int l_price;
	
	private List<BasketVO> baskets;
	
	public OrdertableVO() {
		baskets = new ArrayList<BasketVO>();
	}
	

}
