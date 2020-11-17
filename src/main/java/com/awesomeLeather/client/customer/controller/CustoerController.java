package com.awesomeLeather.client.customer.controller;

import java.io.Console;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.awesomeLeather.client.customer.service.CustomerService;
import com.awesomeLeather.client.customer.vo.CustomerVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes("login")
@Log4j
@RequestMapping("/customer/*")
@AllArgsConstructor
public class CustoerController {
	
	private CustomerService customerService;
	
	@ModelAttribute("login")
	public CustomerVO login() {
		return new CustomerVO();
	}
	
	/**회원 가입 폼 출력하기**/
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		log.info("joinForm 호출 성공");
		
		return "/clientCustomer/joinForm";
	}
	
	/**회원 가입 구현*/
	@RequestMapping(value="/customerInsert", method=RequestMethod.POST)
	public String customerInsert(@ModelAttribute("cvo") CustomerVO cvo) {
		log.info("customerInsert 호출 성공");
		
		int result = 0;
		String url ="";
		
		result = customerService.customerInsert(cvo);
		if(result==1) {			
			url="/customer/loginForm";
		}else {
			url="/customer/joinForm";
		}
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/login")
	/*
	public String login(CustomerVO vo, HttpSession session , RedirectAttributes rttr) throws Exception{
		log.info("login호출 성공");

		CustomerVO cvo = customerService.login(vo);
		
		if(cvo==null) {
			session.setAttribute("customer", null);
			rttr.addFlashAttribute("msg",false);
		}else {
			session.setAttribute("cvo", cvo);
		}
		return "redirect:/ordertable/ordertableList";
		
	}
		*/
	public String login(CustomerVO vo, Model model) throws Exception{
		log.info("호출 성공");
		
		CustomerVO cvo = customerService.login(vo);
		String url = "";
		if(cvo!=null) {
			model.addAttribute("login", cvo);
			url="/ordertable/ordertableList";
		}else {
			url="/customer/loginForm";
		}
		return "redirect:"+url;
	}

	
	/**로그인 폼 출력하기*/
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		log.info("loginForm 호출 성공");
		
		return "/clientCustomer/loginForm";
	}
	
	/**아이디 중복 체크*/
	
	@PostMapping(value="/idCheck", produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String idCheck(CustomerVO cvo) {
		log.info("loginCheck 호출 성공");
		
		int result = customerService.idCheck(cvo);
		log.info("result =" +result);
		
		return String.valueOf(result);
	}
	
	
	
	/**로그인 정보 확인*/
	@ResponseBody
	@PostMapping(value="/loginCheck", produces= {MediaType.TEXT_PLAIN_VALUE})
	public String loginCheck(CustomerVO cvo) {
		log.info("loginCheck 호출 성공");
		
		int result = customerService.loginCheck(cvo);
		log.info("result =" +result);
		
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/updateForm")
	public String updateForm(@SessionAttribute("login") CustomerVO vo, Model model) {
		log.info("updateForm 호출 성공");
	
		CustomerVO cvo = customerService.updateList(vo);
		model.addAttribute("cvo", cvo);
		log.info("cvo:"+cvo);
		log.info("vo.c_num:"+vo.getC_num());
		
		return "/clientCustomer/updateForm";
	}
	
	@RequestMapping(value="/customerUpdate")
	public String customerUpdate(@ModelAttribute("cvo") CustomerVO cvo) {
		log.info("customerUpdate 호출 성공");
		
		int result = 0;
		String url ="";
		
		result = customerService.customerUpdate(cvo);
		if(result==1) {
			url="/customer/orderList";
		}else {
			url="/customer/updateForm";
		}
		return "redirect:"+url;
	}
	
	/**로그아웃*/
	@RequestMapping("/logout")
	/*
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/";
	}
	*/
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/";
	}

}
