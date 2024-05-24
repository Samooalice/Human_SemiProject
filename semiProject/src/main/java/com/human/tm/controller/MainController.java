package com.human.tm.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	public ModelAndView loginProc(@RequestParam String code, ModelAndView mv, HttpSession session) {
		System.out.println("************************************** loginProc in");
		String accessToken = getAccessToken(code);
		
		HashMap<String, Object> userInfo = getUserInfo(accessToken);
        String nickname = (String)userInfo.get("nickname");
		
        session.setAttribute("SID", nickname);
        String sid = (String) session.getAttribute("SID");
        
        mv.addObject("NAME", nickname);
		mv.setViewName("main");
		
		return mv;
	}
	
	private String getAccessToken(String code) {
        String accessToken = "";
        String reqUrl = "https://kauth.kakao.com/oauth/token";
        String client_id = "10f828f2b853279cbebdc8641fe75b33";
        String redirect_uri = "http://58.72.151.124:6002/tm/loginProc.tm";

        try {
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setDoOutput(true);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=").append(client_id);
            sb.append("&redirect_uri=").append(redirect_uri);
            sb.append("&code=").append(code);

            bw.write(sb.toString());
            bw.flush();
            bw.close();

            int responseCode = conn.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line;
            StringBuilder response = new StringBuilder();
            while ((line = br.readLine()) != null) {
                response.append(line);
            }
            br.close();

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(response.toString());
            accessToken = jsonNode.get("access_token").asText();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accessToken;
    }
	
	 private HashMap<String, Object> getUserInfo(String accessToken) {
	        HashMap<String, Object> userInfo = new HashMap<>();
	        try {
	            URL url = new URL("https://kapi.kakao.com/v2/user/me");
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	            int responseCode = conn.getResponseCode();

	            BufferedReader br;
	            if (responseCode >= 200 && responseCode <= 300) {
	                // UTF-8 인코딩 설정
	                br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	            } else {
	                // UTF-8 인코딩 설정
	                br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
	            }

	            String line;
	            StringBuilder responseSb = new StringBuilder();
	            while ((line = br.readLine()) != null) {
	                responseSb.append(line);
	            }
	            String result = responseSb.toString();

	            ObjectMapper objectMapper = new ObjectMapper();
	            JsonNode rootNode = objectMapper.readTree(result);

	            JsonNode properties = rootNode.get("properties");
	            JsonNode kakaoAccount = rootNode.get("kakao_account");

	            String nickname = properties.get("nickname").asText();
	            String email = kakaoAccount.get("email").asText();

	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);

	            br.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return userInfo;
	    }
	
	@RequestMapping("/logoutProc.tm")
	public ModelAndView logoutProc(HttpSession session, ModelAndView mv) {
		System.out.println("************************************** logout");
		
		String sid = (String) session.getAttribute("SID");
		session.removeAttribute("SID");
		mv.setViewName("main");
		
		return mv;
	}
	
	
}

