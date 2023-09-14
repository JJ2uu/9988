package com.tripleJ.gg88.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.QnaReply;

public interface QnaReplyService {
	
	void qnaInsert(HttpSession session, QnaReply qnaReplyVO);
	
	void reReplyInsert(HttpSession session, QnaReply qnaReplyVO);
	
	void reReplyList(HttpSession session,int groupId, Model model);

}
