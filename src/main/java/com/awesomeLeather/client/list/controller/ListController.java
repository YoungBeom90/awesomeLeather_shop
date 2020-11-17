package com.awesomeLeather.client.list.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.awesomeLeather.client.list.service.ListService;
import com.awesomeLeather.client.list.vo.ListVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/list/*")
@AllArgsConstructor
public class ListController {
	
	private ListService listService;
	
	@RequestMapping(value="/orderList")
	public String orderList(int o_num,Model model) {
		log.info("orderList 호출 성공");
		List<ListVO> list = listService.orderList(o_num);
		model.addAttribute("listList",list);
		return "/clientCustomer/orderList";
	}
	
	

}
