package com.human.tm.controller;

import java.util.*;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.*;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.PrettyPrinter;
import com.fasterxml.jackson.databind.*;

@RestController
public class KKORestAPI {
	@RequestMapping("/login.tm")
	public ModelAndView kakaoLogin() {
		System.out.println("*********************************** in");
		String client_id = "10f828f2b853279cbebdc8641fe75b33";
		String redirect_url = "http://58.72.151.124:6002/tm/";
		
		String login_url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirect_url;
		
		return new ModelAndView("redirect:" + login_url);
	}
    //카카오톡 오픈빌더로 리턴할 스킬 API
    @RequestMapping(value = "/kkoCha_ageYes.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> Yes() {
        Map<String, Object> response = new HashMap<>();
        
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        outputs.put("simpleText", simpleText);

        simpleText.put("text", "간단한 텍스트 요소입니다.");
        
        return ResponseEntity.ok(response);
    }
    
    //카카오톡 오픈빌더로 리턴할 스킬 API
    @RequestMapping(value = "/kkoChat_ageNo.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> No() {
        Map<String, Object> response = new HashMap<>();
        
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        outputs.put("simpleText", simpleText);

        simpleText.put("text", "간단한 텍스트 요소입니다.");
        System.out.println("청년층 입니다");
        return ResponseEntity.ok(response);
    }
}