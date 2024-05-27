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
import com.human.tm.vo.MemberVO;

@Controller
public class MainController {
	
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/main.tm")
	public String getMain() {
		return "main";
	}
	
	@RequestMapping("/redirect.tm")
	public String getredirect() {
		return "redirect";
	}
	
//	@RequestMapping("/result.tm")
//	public String getResult() {
//		return "result";
//	}
	
	@RequestMapping("/join.tm")
	public String getJoin() {
		return "join";
	}
	
	@RequestMapping("/edit.tm")
	public String getEdit() {
		return "edit";
	}

	@RequestMapping("/loginProc.tm")
	public ModelAndView loginProc(@RequestParam String code, ModelAndView mv, HttpSession session, MemberVO mVO, RedirectView rv) {
	    System.out.println("************************************** loginProc in");

	    String accessToken = null;
	    try {
	        accessToken = getAccessToken(code);
	    } catch (Exception e) {
	        System.out.println("Error getting access token: " + e.getMessage());
	        e.printStackTrace();
	        rv.setUrl("/tm/main.tm");
	        mv.setView(rv);
	        return mv;
	    }

	    HashMap<String, Object> userInfo = null;
	    try {
	        userInfo = getUserInfo(accessToken);
	    } catch (Exception e) {
	        System.out.println("Error getting user info: " + e.getMessage());
	        e.printStackTrace();
	        rv.setUrl("/tm/main.tm");
	        mv.setView(rv);
	        return mv;
	    }

	    String nickname = (String) userInfo.get("nickname");

	    if (nickname == null) {
	        System.out.println("Nickname is null");
	        rv.setUrl("/tm/main.tm");
	    } else {
	        System.out.println("Nickname: " + nickname);

	        int cnt = 0;
	        
	        try {
	            cnt = mDao.nickCount(nickname);
	        } catch (Exception e) {
	            System.out.println("Error checking nickname count: " + e.getMessage());
	            e.printStackTrace();
	            rv.setUrl("/tm/main.tm");
	            mv.setView(rv);
	            return mv;
	        }

	        session.setAttribute("SID", nickname);

	        try {
	            String encodedNickname = URLEncoder.encode(nickname, "UTF-8");
	            if (cnt == 0) {
	                // 회원가입이 안된 경우
	                rv.setUrl("/tm/join.tm?nickname=" + encodedNickname);
	            } else {
	                // 회원가입이 된 경우
	                rv.setUrl("/tm/main.tm?nickname=" + encodedNickname);
	            }
	        } catch (UnsupportedEncodingException e) {
	            System.out.println("Error encoding nickname: " + e.getMessage());
	            e.printStackTrace();
	            rv.setUrl("/tm/join.tm");
	        }
	    }

	    mv.setView(rv);
	    return mv;
	}
	
	@RequestMapping("/joinProc.tm")
	public ModelAndView joinProc(ModelAndView mv, RedirectView rv, MemberVO mVO) {
		System.out.println("************************************** joinProc in");
		int cnt = mDao.addMemb(mVO);
		
		if(cnt == 1) {
			rv.setUrl("/tm/main.tm");
		}else {
			rv.setUrl("/tm/join.tm");
		}
		
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/editProc.tm")
	public ModelAndView editProc(MemberVO mVO, RedirectView rv, ModelAndView mv) {
		System.out.println("************************************** editProc in");
		System.out.println(mVO);
		int cnt = mDao.editMembInfo(mVO);
		System.out.println(cnt);
		
		if(cnt == 1) {
			rv.setUrl("/tm/main.tm");
		}else {
			rv.setUrl("/tm/edit.tm");
		}
		
		mv.setView(rv);
		return mv;
	}

	private String getAccessToken(String code) {
        String accessToken = "";
        String reqUrl = "https://kauth.kakao.com/oauth/token";
        String client_id = "10f828f2b853279cbebdc8641fe75b33";
        String redirect_uri = "http://58.72.151.124:6003/tm/loginProc.tm";

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
	@RequestMapping("/getJsonVO.tm")
	public ModelAndView getJsonVO(HttpSession session, ModelAndView mv, MemberVO mVO) {
		System.out.println("************************************** getJson");
		
		mv.setViewName("resultToVO");
		
		return mv;
	}
	
	@RequestMapping("/getResult.tm")
	public ModelAndView getResult(HttpSession session, ModelAndView mv, MemberVO mVO) {
		System.out.println("************************************** getResult");
		
		System.out.println(mVO.getBirth());
		System.out.println(mVO.getInterest_type());
		System.out.println(mVO.getMain_bank());

		String nickname = (String) session.getAttribute("SID");
		String type = mVO.getType();		
		List<MemberVO> list = null;
		if(type == null) {
			list = mDao.goodsList1(mVO);
		} else if (type =="type") {
			list = mDao.goodsList2(mVO);
		} else if(type == "bank") {
			list = mDao.goodsList3(mVO);
		} else {
			list = mDao.goodsList1(mVO);
		}
		
		mv.addObject("LIST", list);
		mv.addObject("DATA", mVO);
		mv.setViewName("result");
		System.out.print(mv.getViewName());
		return mv;
	}
}
