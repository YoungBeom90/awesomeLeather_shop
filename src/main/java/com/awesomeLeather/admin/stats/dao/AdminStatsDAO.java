package com.awesomeLeather.admin.stats.dao;

public interface AdminStatsDAO {
	public int adminStatsCustomerTotal();
	public int adminStatsPriceTotal();
	public int adminStatsListTotal();
	public int adminStatsProductTotal();
	public int adminStatsCustomerToday();
	public int adminStatsPriceToday();
	public int adminStatsListToday();
	public int adminStatsDeliveryWait();
}
