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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.human.tm.dao.MemberDao;
import com.human.tm.util.PageUtil;
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
	

	    String accessToken = null;
	    try {
	        accessToken = getAccessToken(code);
	    } catch (Exception e) {
	        e.printStackTrace();
	        rv.setUrl("/tm/main.tm");
	        mv.setView(rv);
	        return mv;
	    }
	    
	    String nickname = null;
	    HashMap<String, Object> userInfo = null;
	    try {
	        userInfo = getUserInfo(accessToken);
	        nickname = (String) userInfo.get("nickname");
	        session.setAttribute("SID", nickname);
	    } catch (Exception e) {
	        e.printStackTrace();
	        rv.setUrl("/tm/main.tm");
	        mv.setView(rv);
	        return mv;
	    }


	    if (nickname == null) {
	        System.out.println("Nickname is null");
	        rv.setUrl("/tm/main.tm");
	    } else {
//	        System.out.println("Nickname: " + nickname);

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
		int cnt = mDao.editMembInfo(mVO);
		
		
		
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
		String sid = (String) session.getAttribute("SID");
		session.removeAttribute("SID");
		mv.setViewName("main");
		
		return mv;
	}
	

	@RequestMapping("/getJsonVO.tm")
	public ModelAndView getJsonVO(HttpSession session, ModelAndView mv, MemberVO mVO) {
		mv.setViewName("resultToVO");
		return mv;
	}
	
	
	
	@RequestMapping("/getResult.tm")
	public ModelAndView getResult(HttpSession session, ModelAndView mv, MemberVO mVO, PageUtil page) {
		String nickname = (String) session.getAttribute("SID");
		
		if(nickname != null) {
			mVO.setNickname(nickname);
		}
		
		int nowPage = page.getNowPage();
		if(nowPage == 0) {
			nowPage = 1;
		}
		
		int totalCnt = mDao.listCount(mVO);
	    
		page.setPage(nowPage, totalCnt);
		
		mVO.setNowPage(page.getNowPage());
		mVO.setStartRno(page.getStartRno());
		mVO.setEndRno(page.getEndRno());
		
		List<MemberVO> list = mDao.goodsList(mVO);
	
		mv.addObject("LIST", list);
		mv.addObject("DATA", mVO);
		mv.addObject("PAGE", page);
		mv.setViewName("result");
		
		return mv;
	}
	
	// 상세보기 함수
	@RequestMapping("/resultDetail.tm")
	@ResponseBody
	public MemberVO prodDetail(MemberVO mVO) {
		mVO = mDao.getDetail(mVO);
		return mVO;
	}
	
}