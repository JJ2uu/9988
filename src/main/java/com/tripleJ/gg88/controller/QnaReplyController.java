package com.tripleJ.gg88.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.domain.QnaReply;
import com.tripleJ.gg88.service.QnaReplyService;

@Controller
public class QnaReplyController {
	
	@Autowired
	QnaReplyService qnaReplyService;
	
	@RequestMapping("qna/qnaReplyInsert")
	@ResponseBody
	public void qnaInsert(HttpSession session, QnaReply qnaReplyVO) {
		qnaReplyService.qnaInsert(session, qnaReplyVO);
	}
	
	@RequestMapping("qna/reReplyInsert")
	@ResponseBody
	public void reReplyInsert(HttpSession session, QnaReply qnaReplyVO) {
		qnaReplyService.reReplyInsert(session, qnaReplyVO);
	}
	
	@RequestMapping("qna/reReplyList")
	public void reReplyList(HttpSession session,int groupId, Model model) {
		qnaReplyService.reReplyList(session, groupId, model);
	}

}
