package com.awesomeLeather.client.basket.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.awesomeLeather.admin.customer.vo.AdminCustomerVO;
import com.awesomeLeather.client.basket.service.BasketService;
import com.awesomeLeather.client.basket.vo.BasketVO;
import com.awesomeLeather.client.customer.vo.CustomerVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/basket/*")
@AllArgsConstructor
public class BasketController {
	
	private BasketService basketService;
	
	

	@RequestMapping(value="/basketList")
	public String basketList(@SessionAttribute("login") CustomerVO cvo , Model model) {
		log.info("basketList 호출 성공");		
		
		List<BasketVO> bvo = basketService.basketList(cvo.getC_num());
	
		model.addAttribute("list", bvo);
		return "/clientCustomer/basketList";
	}
	
	@RequestMapping(value="/basketInsert")
	public String basketInsert(BasketVO bvo) {
		log.info("basketInsert 호출 성공");
		
		int result = basketService.basketInsert(bvo);
		
		return "/basket/basketList";
	}

}