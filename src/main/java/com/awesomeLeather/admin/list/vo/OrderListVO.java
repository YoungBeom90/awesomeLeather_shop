package com.awesomeLeather.admin.list.vo;

import com.awesomeLeather.admin.order.vo.OrderVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class OrderListVO extends OrderVO{
	private int l_num = 0;
	private String l_name = "";
	private String l_price = "";
	private String l_address = "";
	private String l_color = "";
	private String l_size = "";
	private int l_cnt = 0;
	private String o_name = "";
	private String o_phone = "";
	private String o_address = "";

}