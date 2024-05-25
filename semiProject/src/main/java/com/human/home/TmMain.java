package com.human.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TmMain {
	
	@RequestMapping("/")
	public String getMain() {
		return "main";
	}
}