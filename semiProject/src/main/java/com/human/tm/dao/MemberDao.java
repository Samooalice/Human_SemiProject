package com.human.tm.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.human.tm.vo.*;

public class MemberDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 회원가입이 된 회원의 관심분야에 해당하는 상품에 관한 소식들을 보여주는 함수
		public List<MemberVO> goodsList(MemberVO mVO) {
			return session.selectList("mSQL.typeList", mVO);
		}
		
	// 	상품 리스트 전체 갯수 조회 함수
		public int listCount(MemberVO mVO) {
			return session.selectOne("mSQL.selTotal", mVO);
		}
		
	// 상세보기 회원정보 조회함수
		public MemberVO getDetail(MemberVO mVO) {
			return session.selectOne("mSQL.prodDetail", mVO);
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