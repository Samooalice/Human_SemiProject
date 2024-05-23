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
	
	@RequestMapping("/result.tm")
	public String getResult() {
		return "result";
	}
	
	@RequestMapping("/loginProc.tm")
	public ModelAndView loginProc(ModelAndView mv) {
		System.out.println("************************************** loginProc in");
		
		boolean islogin = true;

		mv.addObject("ISLOGIN", islogin);		
		mv.setViewName("main");
		
		return mv;
	}
	
	//@RequestMapping("/logoutProc.tm")
	//public ModelAndView logoutProc
}