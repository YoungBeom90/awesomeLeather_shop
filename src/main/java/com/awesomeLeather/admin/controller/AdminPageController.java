package com.awesomeLeather.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminPageController {
	@RequestMapping("")
	public String index() {
		return "/admin";
	}
}