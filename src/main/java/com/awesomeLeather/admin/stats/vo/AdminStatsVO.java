package com.awesomeLeather.admin.stats.vo;

import lombok.Data;

@Data
public class AdminStatsVO {
	private int customer_total = 0;
	private int price_total = 0;
	private int list_total = 0;
	private int product_total = 0;
	private int customer_today = 0;
	private int price_today = 0;
	private int list_today = 0;
	private int delivery_wait = 0;

}
