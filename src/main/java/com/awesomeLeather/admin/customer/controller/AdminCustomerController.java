package com.awesomeLeather.admin.customer.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.awesomeLeather.admin.customer.service.AdminCustomerService;
import com.awesomeLeather.admin.customer.vo.AdminCustomerVO;
import com.awesomeLeather.client.customer.vo.CustomerVO;
import com.awesomeLeather.client.list.vo.ListVO;
import com.awesomeLeather.client.ordertable.vo.OrdertableVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminCustomer/*")
@AllArgsConstructor
public class AdminCustomerController {
	
	private AdminCustomerService adminCustomerService;
	
	/****************************
	 * 글 목록 구현하기 (페이징 처리 목록 조회)
	 ****************************/	
	@RequestMapping(value="/adminCustomerList", method=RequestMethod.GET)	
	public String adminCustomerList(@ModelAttribute("data") AdminCustomerVO cvo, Model model) {
		log.info("adminCustomerList 호출 성공");
		
		// 전체 레코드 조회		
		List<AdminCustomerVO> adminCustomerList = adminCustomerService.adminCustomerList(cvo);
		model.addAttribute("adminCustomerList", adminCustomerList);		 
		
		return "/adminCustomer/adminCustomerList";
	}
	
	/*******************
	 * 글 상세보기 구현
	 *******************/
	@RequestMapping(value="/adminCustomerDetail", method=RequestMethod.GET)	
	public String adminCustomerDetail(@ModelAttribute("data") AdminCustomerVO cvo, Model model) {
		log.info("adminCustomerDetail 호출 성공");		
				
		
		AdminCustomerVO adminCustomerDetail = adminCustomerService.adminCustomerDetail(cvo);
		log.info("cvo.c_num:"+cvo.getC_num());
		List<ListVO> list =adminCustomerService.adminOrderList(cvo);
		log.info("list:"+list.toString());
		
		model.addAttribute("adminCustomerDetail", adminCustomerDetail);
		model.addAttribute("list",list);
		 
		return "/adminCustomer/adminCustomerDetail";
	}
		
	/*******************
	 * 회원의 구매 이력 여부 확인
	 *******************/
	@ResponseBody
	@RequestMapping(value="/customerDeleteCheck")
	public String customerDeleteCheck(@RequestParam("c_num") int c_num) {
		log.info("customerDeleteCheck 호출 성공");
		
		int result = adminCustomerService.customerDeleteCheck(c_num);
		
		log.info("result = " + result);
		return String.valueOf(result);
	}
	
	/*******************
	 * 구매이력이 없는 회원 탈퇴 처리
	 *******************/	
	@RequestMapping(value="/customerDelete")
	public String customerDelete(AdminCustomerVO cvo) {
		log.info("customerDeleteCheck 호출 성공");
		
		int result = adminCustomerService.customerDelete(cvo);
		if(result==1) {
			log.info("탈퇴성공");
		} else {
			log.info("탈퇴실패");
		}
		String url = "/adminCustomer/adminCustomerList"	;	
		return "redirect:"+url;
	}
	
	/*******************
	 * 구매이력이 있는 회원 탈퇴 처리
	 *******************/	
	@RequestMapping(value="/customerDeleteName")
	public String customerDeleteName(AdminCustomerVO cvo) {
		log.info("customerDeleteCheck 호출 성공");
		
		int result = adminCustomerService.customerDeleteName(cvo);
		
		if(result==1) {
			log.info("탈퇴성공");
		}else {
			log.info("탈퇴실패");
		}
		String url = "/adminCustomer/adminCustomerList";
		return "redirect:"+url;
	}
	
}