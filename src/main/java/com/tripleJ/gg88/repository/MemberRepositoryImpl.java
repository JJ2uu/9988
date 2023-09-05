package com.tripleJ.gg88.repository;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripleJ.gg88.domain.MemberVO;

@Repository
public class MemberRepositoryImpl implements MemberRepository {
	
	String namespace = "member.";
	
	@Autowired
	SqlSessionTemplate sql;

	public MemberVO searchId(String id) {
		return sql.selectOne(namespace + "searchId", id);
	}
	
	public MemberVO searchNick(String nickname) {
		return sql.selectOne(namespace + "searchNick", nickname);
	}
	
	public MemberVO checkEmail(Map<String, Object> userDataMap) {
		return sql.selectOne(namespace + "checkEmail", userDataMap);
	}
	
	public int signUp(MemberVO memberVO) {
		return sql.insert(namespace + "signUp", memberVO);
	}
	
	public MemberVO signIn(MemberVO memberVO) {
		return sql.selectOne(namespace + "signIn", memberVO);
	}
	
	public void keepLogin(Map<String, Object> userDataMap) {
		sql.update(namespace + "keepLogin", userDataMap);
	}
	
	public MemberVO checkSessionKey(String sessionId) {
		return sql.selectOne(namespace + "checkSession", sessionId);
	}
	
	public MemberVO searchEmail(String email) {
		return sql.selectOne(namespace + "searchEmail", email);
	}
	
	public void updatePw(Map<String, Object> userDataMap) {
		sql.update(namespace + "updatePw", userDataMap);
	}
}