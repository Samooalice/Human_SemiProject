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
	
	@RequestMapping("/redirect.tm")
	public String getredirect() {
		return "redirect";
	}
	
	@RequestMapping("/loginProc.tm")
	public ModelAndView loginProc(ModelAndView mv) {
		System.out.println("************************************** loginProc in");
		mv.setViewName("main");
		
		return mv;
	}
}