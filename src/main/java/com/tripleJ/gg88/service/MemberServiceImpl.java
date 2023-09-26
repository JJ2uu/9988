package com.tripleJ.gg88.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import com.tripleJ.gg88.domain.Member;
import com.tripleJ.gg88.domain.Qna;
import com.tripleJ.gg88.domain.QnaReply;
import com.tripleJ.gg88.repository.MemberRepository;
import com.tripleJ.gg88.repository.QnaRepository;
import com.tripleJ.gg88.repository.QnaReplyRepository;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberRepository memberRepo;
	
	@Autowired
	QnaRepository qnaRepo;
	
	@Autowired
	QnaReplyRepository replyRepo;
	
	@Autowired
	BcryptService bcrypt;
	
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
	
	public String foundId(String email, Model model) {
		Member memberVO = memberRepo.searchEmail(email);
		if (memberVO != null) {
			StringBuilder userIdSb = new StringBuilder();
			int len = memberVO.getId().length()/2;
			userIdSb.append(memberVO.getId().substring(0, len));
			for (int i = len+1; i < memberVO.getId().length(); i++) {
				userIdSb.append("*");
			}
			String formattedDate = formattedDate(memberVO.getSubscription());
			model.addAttribute("userId", userIdSb.toString());
			model.addAttribute("subscription", formattedDate);
			return "account/foundId";
		} else {
			return "account/notFoundId";
		}
	}
	
	public String findPw(String userId, Model model) {
		String result = searchId(userId);
		if (result.equals(null)) {
			return "account/notFoundId";
		} else {
			model.addAttribute("userId", userId);
			return "account/resetPw";
		}
	}
	
	public String checkEmail(String userId, String email) {
		Map<String, Object> userDataMap = new HashMap<String, Object>();
		userDataMap.put("userId", userId);
		userDataMap.put("email", email);
		Member result = memberRepo.checkEmail(userDataMap);
		if (result == null) {
			return "null";
		} else {
			return "notNull";
		}
	}
	
	public String changePw() {
		return "account/changePw";
	}
	
	public void updatePw(Member memberVO, String newPw) {
		Map<String, Object> userDataMap = new HashMap<String, Object>();
		if (memberVO.getEmail() == null) {
			Member result = memberRepo.searchNick(memberVO.getNickname());
			memberVO.setEmail(result.getEmail());
		}
		userDataMap.put("email", memberVO.getEmail());
		userDataMap.put("pw", bcrypt.encode(newPw));
		memberRepo.updatePw(userDataMap);
	}
	
	public void updateNick(String nickname, String newNick, HttpServletRequest request) {
		Map<String, Object> userDataMap = new HashMap<String, Object>();
		userDataMap.put("nickname", nickname);
		userDataMap.put("newNickname", newNick);
		memberRepo.updateNick(userDataMap);
		request.getSession().setAttribute("userNick", newNick);
	}
	
	public String searchId(String userId) {
		Member result = memberRepo.searchId(userId);
		if (result == null) {
			return "null";
		} else {
			return "notNull";
		}
	}
	
	public String searchNick(String nickname) {
		Member result = memberRepo.searchNick(nickname);
		if (result == null) {
			return "null";
		} else {
			return "notNull";
		}
	}
	
	public int signUp(Member memberVO, String userbirth) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date birth = dateFormat.parse(userbirth);
			memberVO.setBirth(birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String pwBcrypt = bcrypt.encode(memberVO.getPw());
		memberVO.setPw(pwBcrypt);
		int result = memberRepo.signUp(memberVO);
		return result;
	}
	
	public String signIn(String id, String pw, boolean loginKeep, HttpServletRequest request, HttpServletResponse response) {
		Member memberVO = new Member();
		memberVO.setId(id);
		Member result = memberRepo.searchId(id);
		if (result != null) {
			if (bcrypt.match(pw, result.getPw())) {
				if (loginKeep) {
					int limitTime = 60 * 60 * 24 * 7;
					Cookie cookie = new Cookie("loginCookie", request.getSession().getId());
					cookie.setPath("/");
					cookie.setMaxAge(limitTime);
					response.addCookie(cookie);
					long expiredDate = System.currentTimeMillis()+(limitTime*1000);
					Date sessionLimit = new Date(expiredDate);
					keepLogin(id, request.getSession().getId(), sessionLimit);
				}
				request.getSession().setAttribute("memberNo", result.getMemberNo());
				request.getSession().setAttribute("userId", result.getId());
				request.getSession().setAttribute("userNick", result.getNickname());
				return "success";
			} else {
				return "failure";
			}
		} else {
			return "notExist";
		}
	}
	
	public String autoSignIn(String sessionId) {
		Member memberVO = checkSessionKey(sessionId);
		if (memberVO != null) {
		    return memberVO.getNickname(); 
		} else {
			return "notValid";
		}
	}
	
	public void keepLogin(String userId, String sessionId, Date sessionLimit) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", userId);
		map.put("sessionId", sessionId);
		map.put("sessionLimit", sessionLimit);
		memberRepo.keepLogin(map);
	}
	
	public Member checkSessionKey(String sessionId) {
		return memberRepo.checkSessionKey(sessionId);
	}
	
	public String signOut(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        if (loginCookie != null){
            loginCookie.setPath("/");
            loginCookie.setMaxAge(0);
            response.addCookie(loginCookie);
             
            Date date = new Date(System.currentTimeMillis());
            keepLogin((String)session.getAttribute("userId"), "none", date);
        }
        session.invalidate();
		return "redirect:../9988_main.jsp";
	}
	
	public String myInfo(String nickname, Model model) {
		Member memberVO = memberRepo.searchNick(nickname);
		StringBuilder userIdSb = new StringBuilder();
		int len = memberVO.getId().length()/2;
		userIdSb.append(memberVO.getId().substring(0, len));
		for (int i = len+1; i < memberVO.getId().length(); i++) {
			userIdSb.append("*");
		}
		
		String originalPhone = memberVO.getTel();
		StringBuilder phoneSb = new StringBuilder();
		phoneSb.append(originalPhone.substring(0, 3));
		phoneSb.append("-****-**");
		phoneSb.append(originalPhone.substring(9, 11));

		model.addAttribute("userPhone", phoneSb.toString());
		model.addAttribute("userId", userIdSb.toString());
		model.addAttribute("member", memberVO);
		return "info/myInfo";
	}
	
	public Map<String, Integer> totalCnt(String nickname) {
		Member memberVO = memberRepo.searchNick(nickname);
		List<Qna> userQnaList = qnaRepo.userQnaList(memberVO.getMemberNo());
		List<QnaReply> userReplyList = replyRepo.userReplyList(memberVO.getMemberNo());
		Map<String, Integer> totalCnt = new HashMap<>();
		totalCnt.put("myQna", userQnaList.size());
		totalCnt.put("myReply", userReplyList.size());
		totalCnt.put("myLike", 0);
		return totalCnt;
	}
	
	public String myQna(String nickname, int page, int pageSize, Model model) {
		Member memberVO = memberRepo.searchNick(nickname);
		List<Qna> userQnaList = qnaRepo.userQnaList(memberVO.getMemberNo());
		
		for (Qna qna : userQnaList) {
		    Timestamp originalTimestamp = qna.getDate();
		    long timestampMillis = originalTimestamp.getTime();
		    long adjustedTimestampMillis = timestampMillis - (9 * 60 * 60 * 1000);
		    Timestamp adjustedTimestamp = new Timestamp(adjustedTimestampMillis);
		    qna.setDate(adjustedTimestamp);
		}
		
		int startIndex = (page - 1) * pageSize;
	    int endIndex = Math.min(startIndex + pageSize, userQnaList.size());
	    List<Qna> pageData = userQnaList.subList(startIndex, endIndex);

		model.addAttribute("userQnaList", pageData);
		model.addAttribute("userNick", nickname);
		
		return "info/myQna";
	}
	
	public String myReply(String nickname, int page, int pageSize, Model model) {
		Member memberVO = memberRepo.searchNick(nickname);
		List<QnaReply> userReplyList = replyRepo.userReplyList(memberVO.getMemberNo());
		
		for (QnaReply reply : userReplyList) {
			Timestamp originalTimestamp = reply.getDate();
			long timestampMillis = originalTimestamp.getTime();
			long adjustedTimestampMillis = timestampMillis - (9 * 60 * 60 * 1000);
			Timestamp adjustedTimestamp = new Timestamp(adjustedTimestampMillis);
			reply.setDate(adjustedTimestamp);
		}
		
		int startIndex = (page - 1) * pageSize;
		int endIndex = Math.min(startIndex + pageSize, userReplyList.size());
		List<QnaReply> pageData = userReplyList.subList(startIndex, endIndex);
		
		model.addAttribute("userReplyList", pageData);
		model.addAttribute("userNick", nickname);
		
		return "info/myReply";
	}
	
	public String profile(String nickname) {
		Member memberVO = memberRepo.searchNick(nickname);
		return memberVO.getProfile();
	}
	
	public String formattedDate(Timestamp originalDate) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(originalDate);
		calendar.add(Calendar.HOUR, -9);
		Date adjustedDate = calendar.getTime();
		SimpleDateFormat format = new SimpleDateFormat("yyyy. MM. dd");
		String formattedDate = format.format(adjustedDate);
		return formattedDate;
	}
}
