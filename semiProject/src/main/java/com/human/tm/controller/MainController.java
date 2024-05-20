package com.human.tm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String getMain() {
		return "main";
	}

	@RequestMapping("/test_main.tm")
	public ModelAndView test_Main(ModelAndView mv) {
		mv.setViewName("main");
		return mv;
	}
}