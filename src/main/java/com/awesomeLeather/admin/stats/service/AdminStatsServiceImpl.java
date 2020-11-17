package com.awesomeLeather.admin.stats.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.awesomeLeather.admin.stats.dao.AdminStatsDAO;

import lombok.Setter;

@Service
public class AdminStatsServiceImpl implements AdminStatsService {

	@Setter(onMethod_=@Autowired)
	private AdminStatsDAO adminStatsDAO;
	
	@Override
	public int adminStatsCustomerTotal() {
		int total = 0;
		total = adminStatsDAO.adminStatsCustomerTotal();
		return total;
	}

	@Override
	public int adminStatsPriceTotal() {
		int total = 0;
		total = adminStatsDAO.adminStatsPriceTotal();
		return total;		
	}

	@Override
	public int adminStatsListTotal() {
		int total = 0;
		total = adminStatsDAO.adminStatsListTotal();
		return total;
	}

	@Override
	public int adminStatsProductTotal() {
		int total = 0;
		total = adminStatsDAO.adminStatsProductTotal();
		return total;		
	}

	@Override
	public int adminStatsCustomerToday() {
		int total = 0;
		total = adminStatsDAO.adminStatsCustomerToday();
		return total;		
	}

	@Override
	public int adminStatsPriceToday() {
		int total = 0;
		total = adminStatsDAO.adminStatsPriceToday();
		return total;
	}

	@Override
	public int adminStatsListToday() {
		int total = 0;
		total = adminStatsDAO.adminStatsListToday();
		return total;
	}

	@Override
	public int adminStatsDeliveryWait() {
		int total = 0;
		total = adminStatsDAO.adminStatsDeliveryWait();
		return total;
	}
}
