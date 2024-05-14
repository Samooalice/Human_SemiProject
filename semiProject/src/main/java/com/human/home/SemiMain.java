package com.human.home;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class SemiMain {
	
	@RequestMapping("/")
	public String getMain() {
		return "main";
	}

	@RequestMapping("/main_test")
	public String getMain_test() {
		return "test_main";
	}
}