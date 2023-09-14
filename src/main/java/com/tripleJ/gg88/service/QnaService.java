package com.tripleJ.gg88.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Page;
import com.tripleJ.gg88.domain.Qna;
import com.tripleJ.gg88.domain.QnaReply;

public interface QnaService {
	
	String qnaBoard(Page page, Model model);

	void qnaPage(Page page, Model model);
	
	String qnaCreate();
	
	void qnaContent(HttpSession session, int qnaId, Model model);

	void qnaInsert(HttpSession session, Qna qnaVO);
	
	void qnaIdCheck(HttpSession session, int qnaId, Model model);
	
	void qnaUpdate(HttpSession session, Qna qnaVO);
	
	void qnaDelecte(HttpSession session, Qna qnaVO, QnaReply qnaReplyVO);
	
	void qnaViews(int qnaId);
	
	void replyCount(HttpSession session, int qnaId);
	
	void mainQna(Page page, Model model);
	
}
