package com.awesomeLeather.admin.stats.service;

public interface AdminStatsService {
	public int adminStatsCustomerTotal();
	public int adminStatsPriceTotal();
	public int adminStatsListTotal();
	public int adminStatsProductTotal();
	public int adminStatsCustomerToday();
	public int adminStatsPriceToday();
	public int adminStatsListToday();
	public int adminStatsDeliveryWait();
}