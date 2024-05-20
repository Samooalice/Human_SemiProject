package com.human.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SemiMain {
	
	@RequestMapping("/")
	public String getMain() {
		return "main";
	}
}