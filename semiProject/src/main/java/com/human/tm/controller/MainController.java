package com.human.tm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String getMain() {
		return "main";
	}
	
	@RequestMapping("/testMain")
	public String getTestMain() {
		return "testMain";
	}
}