package com.tripleJ.gg88.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Member;
import com.tripleJ.gg88.domain.Page;
import com.tripleJ.gg88.domain.Qna;
import com.tripleJ.gg88.domain.QnaReply;
import com.tripleJ.gg88.repository.MemberRepository;
import com.tripleJ.gg88.repository.QnaReplyRepository;
import com.tripleJ.gg88.repository.QnaRepository;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	QnaRepository qnaRepo;
	
	@Autowired
	QnaReplyRepository replyRepo;
	
	@Autowired
	MemberRepository memberRepo;
	
	public String qnaBoard( Model model) {
		List<Qna> qnaList = qnaRepo.qnaList();
		model.addAttribute("listCount", qnaList.size());
		return "qna/qnaBoard";
	}
	
	public void qnaPage(int page, int pageSize, Model model) {
	    List<Qna> qnaList = qnaRepo.qnaList();
	    
	    // 페이징을 위한 시작 인덱스와 끝 인덱스 계산
	    int startIndex = (page - 1) * pageSize;
	    int endIndex = Math.min(startIndex + pageSize, qnaList.size());

	    // 페이징된 데이터 추출
	    List<Qna> pageData = qnaList.subList(startIndex, endIndex);

	    List<String> formattedDates = new ArrayList<>();
	    List<String> writerList = new ArrayList<>();
	    
	    // 페이징된 데이터에 대해 작성일과 작성자 목록을 계산
	    for (Qna qnaVO : pageData) {
	        int qnaId = qnaVO.getQnaId();
	        qnaRepo.replyCount(qnaId);
	        
	        int memberNo = qnaVO.getMemberNo();
	        String writer = qnaRepo.NoToNick(memberNo);
	        writerList.add(writer);
	        
	        String formattedDate = formattedDate(qnaVO.getDate());
	        formattedDates.add(formattedDate);
	    }
	    
	    model.addAttribute("pageData", pageData);
	    model.addAttribute("listCount", qnaList.size());
	    model.addAttribute("formattedDates", formattedDates);
	    model.addAttribute("writerList", writerList);
	}

	
	public String qnaCreate() {
		return "qna/qnaCreate";
	}
	
	public void qnaContent(HttpSession session, int qnaId, Model model) {
		Qna qnaVO = qnaRepo.qnaDetail(qnaId);
		List<QnaReply> qnaReplyList = replyRepo.qnaReplyList(qnaId);
		List<String> replyWriterList = new ArrayList<>();
		int memberNo = qnaVO.getMemberNo();
        String writer = qnaRepo.NoToNick(memberNo);
        
        for (QnaReply qnaReply : qnaReplyList) {
        	int replyMemberNo = qnaReply.getMemberNo();
			String replyWriter = qnaRepo.NoToNick(replyMemberNo);
			replyWriterList.add(replyWriter);
		}
        String formattedDate = formattedDate(qnaVO.getDate());
        model.addAttribute("formattedDate", formattedDate);
        model.addAttribute("writer", writer);
        model.addAttribute("replyWriterList", replyWriterList);
		model.addAttribute("qnaVO", qnaVO);
		model.addAttribute("qnaReplyList", qnaReplyList);
		
	}
	
	public void qnaInsert(HttpSession session, Qna qnaVO) {
		qnaRepo.qnaInsert(qnaVO);
	}
	
	public void qnaIdCheck(HttpSession session, int qnaId, Model model) {
		Qna qnaVO = qnaRepo.qnaDetail(qnaId);
		model.addAttribute("qnaVO", qnaVO);
	}
	
	public void qnaUpdate(HttpSession session, Qna qnaVO) {
		qnaRepo.qnaUpdate(qnaVO);
	}
	
	public void qnaDelete(HttpSession session, Qna qnaVO, QnaReply qnaReplyVO) {
		replyRepo.qnaDeleteReply(qnaReplyVO);
		qnaRepo.qnaDelete(qnaVO);
		
	}
	
	public void qnaViews(int qnaId) {
		qnaRepo.qnaViews(qnaId);
	}
	
	public void replyCount(HttpSession session, int qnaId) {
		qnaRepo.replyCount(qnaId);
	}
	
	public void mainQna(Page page, Model model) {
		page.setStartEnd(page.getPage());
		int count = qnaRepo.countAll();
		int pages = 1;
		List<Qna> qnaList = qnaRepo.qnaList();
		List<String> formattedDates = new ArrayList<>();
		
		for (Qna qnaVO : qnaList) {
			int qnaId = qnaVO.getQnaId();
	        qnaRepo.replyCount(qnaId);

	        String formattedDate = formattedDate(qnaVO.getDate());
	        formattedDates.add(formattedDate);
	    }
		
		model.addAttribute("formattedDates", formattedDates);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		
	}
	
	public int NickToNo(String nickname) {
		Member member = memberRepo.searchNick(nickname);
		int memberNo = member.getMemberNo();

		return memberNo;
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
	
	public void searchAllPage(int page, int pageSize, String search, Model model) {
	    List<Qna> qnaList = qnaRepo.searchAll(search);
	    
	    // 페이징을 위한 시작 인덱스와 끝 인덱스 계산
	    int startIndex = (page - 1) * pageSize;
	    int endIndex = Math.min(startIndex + pageSize, qnaList.size());

	    // 페이징된 데이터 추출
	    List<Qna> pageData = qnaList.subList(startIndex, endIndex);

	    List<String> formattedDates = new ArrayList<>();
	    List<String> writerList = new ArrayList<>();
	    
	    // 페이징된 데이터에 대해 작성일과 작성자 목록을 계산
	    for (Qna qnaVO : pageData) {
	        int qnaId = qnaVO.getQnaId();
	        qnaRepo.replyCount(qnaId);
	        
	        int memberNo = qnaVO.getMemberNo();
	        String writer = qnaRepo.NoToNick(memberNo);
	        writerList.add(writer);
	        
	        String formattedDate = formattedDate(qnaVO.getDate());
	        formattedDates.add(formattedDate);
	    }
	    model.addAttribute("pageData", pageData);
	    model.addAttribute("listCount", qnaList.size());
	    model.addAttribute("formattedDates", formattedDates);
	    model.addAttribute("writerList", writerList);
	}
	
	public void categorySearchPage(int page, int pageSize, String search, String category, Model model) {
	    HashMap<String, String> map = new HashMap<String, String>();
	    map.put("search", search);
	    map.put("category", category);
	    
	    List<Qna> qnaList = qnaRepo.categorySearch(map);

	    // 페이징을 위한 시작 인덱스와 끝 인덱스 계산
	    int startIndex = (page - 1) * pageSize;
	    int endIndex = Math.min(startIndex + pageSize, qnaList.size());

	    // 페이징된 데이터 추출
	    List<Qna> pageData = qnaList.subList(startIndex, endIndex);

	    List<String> formattedDates = new ArrayList<>();
	    List<String> writerList = new ArrayList<>();
	    
	    // 페이징된 데이터에 대해 작성일과 작성자 목록을 계산
	    for (Qna qnaVO : pageData) {
	        int qnaId = qnaVO.getQnaId();
	        qnaRepo.replyCount(qnaId);
	        
	        int memberNo = qnaVO.getMemberNo();
	        String writer = qnaRepo.NoToNick(memberNo);
	        writerList.add(writer);
	        
	        String formattedDate = formattedDate(qnaVO.getDate());
	        formattedDates.add(formattedDate);
	    }
	    model.addAttribute("pageData", pageData);
	    model.addAttribute("listCount", qnaList.size());
	    model.addAttribute("formattedDates", formattedDates);
	    model.addAttribute("writerList", writerList);
	}
	

}
