package com.human.tm.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.human.tm.vo.*;

public class MemberDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 회원가입이 된 회원의 관심분야에 해당하는 상품에 관한 소식들을 보여주는 함수
	public List<MemberVO> TypeList(String interest_type) {
		return session.selectList("mSQL.typeList",interest_type);
	}
	
	// 회원가입된 회원의 닉네임 개수 가져오는 함수
	public int nickCount(String nickname) {
		return session.selectOne("mSQL.nickCount",nickname);
	}
	
	// 회원입력 함수
	public int addMemb(MemberVO mVO) {
		return session.insert("mSQL.addMemb", mVO);
	}
	
	// 회원정보수정 함수
	public int editMembInfo(MemberVO mVO) {
		return session.update("mSQL.editMembInfo", mVO);
	}
}
