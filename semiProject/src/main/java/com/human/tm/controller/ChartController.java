package com.human.tm.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.human.tm.dao.MemberDao;
import com.human.tm.util.PageUtil;
import com.human.tm.vo.MemberVO;

@Controller
public class ChartController {
	
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/getChart_1.tm")
	public String getChart_1() {
		return "result_chart1";
	}
	
	@RequestMapping("/getChart_2.tm")
	public String getChart_2() {
		return "result_chart2";
	}

	@RequestMapping("/getChart_3.tm")
	public String getChart_3() {
		return "result_chart3";
	}
	
}