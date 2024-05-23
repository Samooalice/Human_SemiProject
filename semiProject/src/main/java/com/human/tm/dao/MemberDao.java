package com.human.tm.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.human.tm.vo.*;

public class MemberDao {
	@Autowired
	SqlSessionTemplate session;
	
	public List<MemberVO> Types(String interest_type) {
		return session.selectList("mSQL.typeList",interest_type);
	}
}
