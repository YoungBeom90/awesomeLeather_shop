package com.awesomeLeather.admin.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.awesomeLeather.admin.list.vo.OrderListVO;
import com.awesomeLeather.admin.order.service.OrderService;
import com.awesomeLeather.admin.order.vo.OrderVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {
	private OrderService orderService;
	
	/**
	 * 주문관리 이동
	 * @param ovo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/orderList", method = RequestMethod.GET)
	public List<OrderVO> orderList(@ModelAttribute("data") OrderVO ovo, Model model) {
		log.info("orderList 호출 성공.");
		
		List<OrderVO>
		
		
		list = orderService.orderList(ovo);
		model.addAttribute("orderList", list);
		return list;
	}
	
	/**
	 * 주문 상세 페이지 이동
	 * @param ovo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/orderDetail", method = RequestMethod.POST)
	public String orderDetail(@ModelAttribute("data") OrderVO ovo, Model model) {
		log.info("orderDetail 호출 성공.");
		List<OrderListVO> detail = null;
		detail = orderService.orderDetail(ovo);
		model.addAttribute("detail", detail);
		return "order/orderDetail";
	}
	
	/**
	 * 결제 확인으로 주문상태 업데이트
	 * @param ovo
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/statePayUpdate")
	public String statePayUpdate(@ModelAttribute("data") OrderVO ovo) {
		log.info("statePayUpdate 호출 완료");
		String success = "";
		int result = orderService.statePayUpdate(ovo);
		if(result == 1) {
			success = "success";
		}
		
		return success;
	}
	
	/**
	 * 배송완료로 주문상태 업데이트
	 * @param ovo
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/stateDeliUpdate")
	public String stateDeliUpdate(@ModelAttribute("data") OrderVO ovo) {
		log.info("stateDeliUpdate 호출 완료");
		String success = "";
		int result = orderService.stateDeliUpdate(ovo);
		if(result == 1) {
			success = "success";
		}
		
		return success;
	}
	
	/**
	 * 주문 취소 상태 업데이트
	 * @param ovo
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/stateCancelUpdate")
	public String stateCancelUpdate(@ModelAttribute("data") OrderVO ovo) {
		log.info("stateCancelUpdate 호출 완료");
		String success = "";
		int result = orderService.stateCancelUpdate(ovo);
		if(result == 1) {
			success = "success";
		}
		
		return success;
	}
	
	
}
