package com.tripleJ.gg88.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Page;
import com.tripleJ.gg88.domain.Qna;
import com.tripleJ.gg88.domain.QnaReply;
import com.tripleJ.gg88.repository.QnaReplyRepository;
import com.tripleJ.gg88.repository.QnaRepository;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	QnaRepository qnaRepo;
	
	@Autowired
	QnaReplyRepository replyRepo;
	
	public String qnaBoard(Page page, Model model) {
		page.setStartEnd(page.getPage());
		int count = qnaRepo.countAll();
		int pages = count / 10 + 1;
		if (count % 10 == 0) {
			--pages;
		}
		List<Qna> qnaList = qnaRepo.qnaList(page);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> formattedDates = new ArrayList<>();
		
		for (Qna qnaVO : qnaList) {
			int qnaId = qnaVO.getQnaId();
	        qnaRepo.replyCount(qnaId);
			
			Timestamp timestamp = qnaVO.getDate(); // qnaVO에서 날짜 가져오기
	        String formattedDate = dateFormat.format(new Date(timestamp.getTime()));
	        formattedDates.add(formattedDate);
	    }
		
		model.addAttribute("formattedDates", formattedDates);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		return "qna/qnaBoard";
	}
	
	public void qnaPage(Page page, Model model) {
		page.setStartEnd(page.getPage());
		int count = qnaRepo.countAll();
		int pages = count / 10 + 1;
		if (count % 10 == 0) {
			--pages;
		}
		List<Qna> qnaList = qnaRepo.qnaList(page);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> formattedDates = new ArrayList<>();
		
		for (Qna qnaVO : qnaList) {
			int qnaId = qnaVO.getQnaId();
	        qnaRepo.replyCount(qnaId);
	        
	        Timestamp timestamp = qnaVO.getDate(); // qnaVO에서 날짜 가져오기
	        String formattedDate = dateFormat.format(new Date(timestamp.getTime()));
	        formattedDates.add(formattedDate);
	    }
		
		model.addAttribute("formattedDates", formattedDates);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	public String qnaCreate() {
		return "qna/qnaCreate";
	}
	
	public void qnaContent(HttpSession session, int qnaId, Model model) {
		Qna qnaVO = qnaRepo.qnaDetail(qnaId);
		List<QnaReply> qnaReplyList = replyRepo.qnaReplyList(qnaId);
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
	
	public void qnaDelecte(HttpSession session, Qna qnaVO, QnaReply qnaReplyVO) {
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
		List<Qna> qnaList = qnaRepo.qnaList(page);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> formattedDates = new ArrayList<>();
		
		for (Qna qnaVO : qnaList) {
			int qnaId = qnaVO.getQnaId();
	        qnaRepo.replyCount(qnaId);
			
			Timestamp timestamp = qnaVO.getDate(); // qnaVO에서 날짜 가져오기
	        String formattedDate = dateFormat.format(new Date(timestamp.getTime()));
	        formattedDates.add(formattedDate);
	    }
		
		model.addAttribute("formattedDates", formattedDates);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		
	}

}
