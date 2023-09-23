package com.tripleJ.gg88.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Page;
import com.tripleJ.gg88.domain.Qna;
import com.tripleJ.gg88.domain.QnaReply;

public interface QnaService {
	
	String qnaBoard(Model model);

	void qnaPage(int page, int pageSize, Model model);
	
	String qnaCreate();
	
	void qnaContent(HttpSession session, int qnaId, Model model);

	void qnaInsert(HttpSession session, Qna qnaVO);
	
	void qnaIdCheck(HttpSession session, int qnaId, Model model);
	
	void qnaUpdate(HttpSession session, Qna qnaVO);
	
	void qnaDelete(HttpSession session, Qna qnaVO, QnaReply qnaReplyVO);
	
	void qnaViews(int qnaId);
	
	void replyCount(HttpSession session, int qnaId);
	
	void mainQna(Page page, Model model);
	
	int NickToNo(String nickname);
	
}
