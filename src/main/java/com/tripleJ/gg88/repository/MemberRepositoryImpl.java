package com.tripleJ.gg88.repository;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripleJ.gg88.domain.Member;

@Repository
public class MemberRepositoryImpl implements MemberRepository {
	
	String namespace = "member.";
	
	@Autowired
	SqlSessionTemplate sql;

	public Member searchId(String id) {
		return sql.selectOne(namespace + "searchId", id);
	}
	
	public Member searchNick(String nickname) {
		return sql.selectOne(namespace + "searchNick", nickname);
	}
	
	public Member checkEmail(Map<String, Object> userDataMap) {
		return sql.selectOne(namespace + "checkEmail", userDataMap);
	}
	
	public int signUp(Member memberVO) {
		return sql.insert(namespace + "signUp", memberVO);
	}
	
	public Member signIn(Member memberVO) {
		return sql.selectOne(namespace + "signIn", memberVO);
	}
	
	public void keepLogin(Map<String, Object> userDataMap) {
		sql.update(namespace + "keepLogin", userDataMap);
	}
	
	public Member checkSessionKey(String sessionId) {
		return sql.selectOne(namespace + "checkSession", sessionId);
	}
	
	public Member searchEmail(String email) {
		return sql.selectOne(namespace + "searchEmail", email);
	}
	
	public void updatePw(Map<String, Object> userDataMap) {
		sql.update(namespace + "updatePw", userDataMap);
	}
}