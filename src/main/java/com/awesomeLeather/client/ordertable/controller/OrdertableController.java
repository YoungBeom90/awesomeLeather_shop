package com.awesomeLeather.client.ordertable.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.awesomeLeather.client.basket.vo.BasketVO;
import com.awesomeLeather.client.customer.vo.CustomerVO;
import com.awesomeLeather.client.orderdetail.vo.OrderDetailVO;
import com.awesomeLeather.client.ordertable.service.OrdertableService;
import com.awesomeLeather.client.ordertable.vo.OrdertableVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ordertable/*")
@AllArgsConstructor
public class OrdertableController {
	
	private OrdertableService ordertableService;
	
	/**주문상세내역 출력**/
	@RequestMapping(value="/ordertableList")
	/*
	public String ordertableList(@ModelAttribute("ovo") OrdertableVO ovo, Model model, HttpSession session) {
		log.info("ordertableList 호출 성공");
		
		CustomerVO cvo = (CustomerVO)session.getAttribute("cvo");
		ovo.setC_num(cvo.getC_num());
		
		List<OrdertableVO> list = ordertableService.ordertableList(ovo);
		model.addAttribute("list",list);
		return "/clientCustomer/orderList";
	}
	*/
	
	public String ordertableList(@SessionAttribute("login") CustomerVO cvo, @ModelAttribute("ovo") OrdertableVO ovo, Model model) {
		log.info("ordertableList 호출 성공");
		log.info("c_num:"+cvo.getC_num());
		
		ovo.setC_num(cvo.getC_num());
		
		List<OrdertableVO> list = ordertableService.ordertableList(ovo);
		model.addAttribute("list",list);
		return "/clientCustomer/orderList";
	
	}
	
	@RequestMapping(value="/orderDelete")
	public String deleteOrder(int o_num) {
		int result = ordertableService.deleteOrderList(o_num);
		log.info("orderDelete 호출 성공");
		
		log.info("삭제result:"+result);
		log.info(o_num);
		if(result>=1) {
			int result2 = ordertableService.deleteOrdertable(o_num);
			log.info("result2:"+result2);
		}
		
		return "redirect:/ordertable/ordertableList";
		
	}
	@RequestMapping(value="/orderDetail")
	public String orderDetail(int o_num, Model model) {
		log.info("orderDetail 호출 성공");
		OrdertableVO ovo = ordertableService.orderDetail(o_num);
		model.addAttribute("ovo", ovo);
		
		return "/clientCustomer/orderDetailForm";		
		
	}
	@RequestMapping(value="/orderForm")
	public String orderForm(@SessionAttribute("login") CustomerVO cvo, @RequestParam("list") List<Integer> list,  Model model) {
		log.info("orderForm 호출 성공");
		log.info("list" + list.size());
		List<BasketVO> basketList = new ArrayList<BasketVO>();
		BasketVO bbvo = null;
		
		for(int b_num : list) {
			bbvo = new BasketVO();
			bbvo.setC_num(cvo.getC_num());
			bbvo.setB_num(b_num);
			basketList.add(bbvo);
			
			
		}
		
		List<BasketVO> bvo = ordertableService.orderForm(basketList);
		model.addAttribute("bvo", bvo);
		model.addAttribute("cvo", cvo);
		return "/clientCustomer/orderForm";
	}
	
	@RequestMapping(value="/orderInsert")
	public String orderInsert(BasketVO vo, @SessionAttribute("login") CustomerVO cvo, BasketVO bvo, OrderDetailVO dvo) {
		bvo.setC_num(cvo.getC_num());
		int result = ordertableService.orderInsert(bvo);
		int result2= ordertableService.orderInsertDetail(dvo);
		
		return "/clientCustomer/orderList";
	}
	
	
	 
	
	 
	 
	 
	

}
