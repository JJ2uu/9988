package com.tripleJ.gg88.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripleJ.gg88.domain.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate my;

	public MemberVO searchId(String id) {
		MemberVO result = my.selectOne("member.searchId", id);
		return result;
	}
	
	public MemberVO searchNick(String nickname) {
		MemberVO result = my.selectOne("member.searchNick", nickname);
		return result;
	}
	
	public int signUp(MemberVO memberVO) {
		int result = my.insert("member.signUp", memberVO);
		return result;
	}
	
	public MemberVO signIn(MemberVO memberVO) {
		MemberVO result = my.selectOne("member.signIn", memberVO);
		return result;
	}
}
