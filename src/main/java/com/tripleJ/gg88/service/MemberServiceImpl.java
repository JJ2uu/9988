package com.tripleJ.gg88.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.MemberVO;
import com.tripleJ.gg88.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDao;

	
	public String agreement() {
		return "account/agreement";
	}
	
	public String enter() {
		return "account/enter";
	}
	
	public String completed(String nickname, Model model) {
		model.addAttribute("nickname", nickname);
		return "account/completed";
	}
	
	public String foundId() {
		return "account/foundId";
	}
	
	public String notFoundId() {
		return "account/notFoundId";
	}
	
	public String resetPw() {
		return "account/resetPw";
	}
	
	public String changePw() {
		return "account/changePw";
	}
	
	public String searchId(String userId) {
		MemberVO result = memberDao.searchId(userId);
		if (result == null) {
			return "null";
		} else {
			return "notNull";
		}
	}
	
	public String searchNick(String nickname) {
		MemberVO result = memberDao.searchNick(nickname);
		if (result == null) {
			return "null";
		} else {
			return "notNull";
		}
	}
	
	public int signUp(MemberVO memberVO, String userbirth) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date birth = dateFormat.parse(userbirth);
			memberVO.setBirth(birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int result = memberDao.signUp(memberVO);
		return result;
	}
	
	public String myInfo() {
		return "info/myInfo";
	}
	
	public String myHistory() {
		return "info/myHistory";
	}
}
