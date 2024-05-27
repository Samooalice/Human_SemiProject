package com.human.tm.controller;

import java.util.*;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.PrettyPrinter;
import com.fasterxml.jackson.databind.*;
import com.human.tm.vo.*;

@RestController
public class KKORestAPI {
	MemberVO mVO = new MemberVO();
	
	@RequestMapping("/login.tm")
	public ModelAndView kakaoLogin() {
		System.out.println("*********************************** login in");
		String client_id = "10f828f2b853279cbebdc8641fe75b33";
		String redirect_url = "http://58.72.151.124:6003/tm/loginProc.tm";
		
		String login_url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirect_url;
		
		return new ModelAndView("redirect:" + login_url);
	}
	
	// 바로가기 버튼 생성
	private Map<String, Object> createQuickReply(String label, String blockId) {
		Map<String, Object> quickReply = new HashMap<>();
		quickReply.put("label", label);
		quickReply.put("action", "block");
		quickReply.put("blockId", blockId);
		return quickReply;
	}
	
    //나이 입력에 '네'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_ageYes.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getYoung(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "실버 상품은 제외하겠습니다.");
        outputs.put("simpleText", simpleText);
        
        mVO.setBirth("청년층");
        System.out.println("사용자가 [ " + mVO.getBirth() + " ] 을(를) 선택하였습니다.");
        
        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(1/3)", "664d6ba126296c3bea94a4fd"));
        template.put("quickReplies", quickReplies);
        
        return ResponseEntity.ok(response);
    }
    
    
    
    //나이 입력에 '아니오'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_ageNo.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getSilver(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "실버 상품은 제외하겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(1/3)", "664d6ba126296c3bea94a4fd"));
        template.put("quickReplies", quickReplies);

        mVO.setBirth("노년층");
        System.out.println("사용자가 [ " + mVO.getBirth() + " ] 을(를) 선택하였습니다.");
        
        return ResponseEntity.ok(response);
    }

    //나이 입력에 '선택안함'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_ageElse.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getAge_Else(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "모든 나이대의 상품을 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(1/3)", "664d6ba126296c3bea94a4fd"));
        template.put("quickReplies", quickReplies);

        MemberVO mVO = new MemberVO();
        mVO.setBirth("선택안함");
        System.out.println("사용자가 [ 나이_" + mVO.getBirth() + " ] 을(를) 선택하였습니다.");
        
        return ResponseEntity.ok(response);
    }
    
    //성향 입력에 '저축'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_subSave.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getSaving(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "저축 관련 상품 위주로 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(2/3)", "664d803c2b2f2f1765b0ce3e"));
        template.put("quickReplies", quickReplies);

        mVO.setInterest_type("저축");
        System.out.println("사용자가 [ " + mVO.getInterest_type() + " ] 을(를) 선택하였습니다.");
        
        return ResponseEntity.ok(response);
    }
    
    //성향 입력에 '카드'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_subCard.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getCard(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "카드 관련 상품 위주로 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(2/3)", "664d803c2b2f2f1765b0ce3e"));
        template.put("quickReplies", quickReplies);

        mVO.setInterest_type("카드");
        System.out.println("사용자가 [ " + mVO.getInterest_type() + " ] 을(를) 선택하였습니다.");
        return ResponseEntity.ok(response);
    }
    
    //성향 입력에 '투자'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_subInvest.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getInvest(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "투자 관련 상품 위주로 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(2/3)", "664d803c2b2f2f1765b0ce3e"));
        template.put("quickReplies", quickReplies);
       
        mVO.setInterest_type("투자");
        System.out.println("사용자가 [ " + mVO.getInterest_type() + " ] 을(를) 선택하였습니다.");
        return ResponseEntity.ok(response);
    }
    
    //성향 입력에 '대출'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_subLoad.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getLoan(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "대출 관련 상품 위주로 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(2/3)", "664d803c2b2f2f1765b0ce3e"));
        template.put("quickReplies", quickReplies);

        mVO.setInterest_type("대출");
        System.out.println("사용자가 [ " + mVO.getInterest_type() + " ] 을(를) 선택하였습니다.");
        return ResponseEntity.ok(response);
    }
    
    //성향 입력에 '선택안함'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_subElse.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getSub_Else(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "모든 종목의 상품을 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(2/3)", "664d803c2b2f2f1765b0ce3e"));
        template.put("quickReplies", quickReplies);
        mVO.setInterest_type("선택안함");
        System.out.println("사용자가 [ 성향_"+mVO.getInterest_type()+" ] 을(를) 선택하였습니다.");
        return ResponseEntity.ok(response);
    }
    
    //은행 입력에 '국민은행'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_bank_Kook.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getbank_Kook(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "국민 은행의 상품을 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(3/3)", "6648b6c12b2f2f1765aff92b"));
        template.put("quickReplies", quickReplies);

        mVO.setMain_bank("국민은행");
        System.out.println("사용자가 [ " + mVO.getMain_bank() + " ] 을(를) 선택하였습니다.");
        return ResponseEntity.ok(response);
    }
    
    //은행 입력에 '신한은행'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_bank_Sin.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getbank_Sin(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "신한 은행의 상품을 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(3/3)", "6648b6c12b2f2f1765aff92b"));
        template.put("quickReplies", quickReplies);

        mVO.setMain_bank("신한은행");
        System.out.println("사용자가 [ " + mVO.getMain_bank() + " ] 을(를) 선택하였습니다.");
        return ResponseEntity.ok(response);
    }
    
    //은행 입력에 '우리은행'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_bank_Woo.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getbank_Woo(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "우리 은행의 상품을 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(3/3)", "6648b6c12b2f2f1765aff92b"));
        template.put("quickReplies", quickReplies);

        mVO.setMain_bank("우리은행");
        System.out.println("사용자가 [ " + mVO.getMain_bank() + " ] 을(를) 선택하였습니다.");
        return ResponseEntity.ok(response);
    }
    
    //은행 입력에 '하나은행'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_bank_Han.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getbank_Han(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "하나 은행의 상품을 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(3/3)", "6648b6c12b2f2f1765aff92b"));
        template.put("quickReplies", quickReplies);

        mVO.setMain_bank("하나은행");
        System.out.println("사용자가 [ " + mVO.getMain_bank() + " ] 을(를) 선택하였습니다.");
        return ResponseEntity.ok(response);
    }
    
    //은행 입력에 '기타'를 선택했을 경우
    @RequestMapping(value = "/kkoChat_bank_Else.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getbank_Else(@RequestBody Map<String, Object> requestBody) {
        // 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        Map<String, Object> simpleText = new HashMap<>();
        simpleText.put("text", "모든 은행의 상품을 보여드리겠습니다.");
        outputs.put("simpleText", simpleText);

        // QuickReplies 설정
        List<Map<String, Object>> quickReplies = new ArrayList<>();
        quickReplies.add(createQuickReply("다음으로 이동(3/3)", "6648b6c12b2f2f1765aff92b"));
        template.put("quickReplies", quickReplies);

        mVO.setMain_bank("선택안함");
        System.out.println("사용자가 [ 은행_" + mVO.getMain_bank() + " ] 을(를) 선택하였습니다.");
        return ResponseEntity.ok(response);
    }
    
    //결과창 띄우기
    @RequestMapping(value = "/kkoChat_Result.tm", method = {RequestMethod.POST, RequestMethod.GET}, headers = {"Accept=application/json"})
    public ResponseEntity<Map<String, Object>> getResult(@RequestBody Map<String, Object> requestBody) {
    	// 응답 메시지 구성
        Map<String, Object> response = new HashMap<>();
        response.put("version", "2.0");

        Map<String, Object> template = new HashMap<>();
        response.put("template", template);

        // Outputs 설정
        Map<String, Object> outputs = new HashMap<>();
        template.put("outputs", new Map[]{outputs});

        // BasicCard 설정
        Map<String, Object> basicCard = new HashMap<>();
        outputs.put("basicCard", basicCard);

        basicCard.put("title", "결과를 확인해 보겠습니까?");
        
        basicCard.put("description", 
        		"고객님께서 선택하신 내용은"
        		+ "\n- 나이대 : " + mVO.getBirth() 
        		+ "\n- 은행 : " + mVO.getMain_bank()
        		+ "\n- 성향 : " + mVO.getInterest_type()
        		+ "\n입니다."
        		);

        // Thumbnail 설정
        Map<String, Object> thumbnail = new HashMap<>();
        basicCard.put("thumbnail", thumbnail);

        thumbnail.put("imageUrl", "https://t1.kakaocdn.net/openbuilder/sample/lj3JUcmrzC53YIjNDkqbWK.jpg");

        // Buttons 설정
        Map<String, Object>[] buttons = new Map[2];
        basicCard.put("buttons", buttons);

        // 첫 번째 버튼
        Map<String, Object> openButton = new HashMap<>();
        buttons[0] = openButton;

        openButton.put("action", "webLink");
        openButton.put("label", "처음으로");
        openButton.put("webLinkUrl", "http://58.72.151.124:6002/tm/result.tm");

        // 두 번째 버튼
        Map<String, Object> webViewButton = new HashMap<>();
        buttons[1] = webViewButton;
        
        webViewButton.put("action", "webLink");
        webViewButton.put("label", "결과보기");
        webViewButton.put("webLinkUrl", "http://58.72.151.124:6002/tm/");

        return ResponseEntity.ok(response);
    }
}