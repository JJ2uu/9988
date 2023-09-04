package com.tripleJ.gg88.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.domain.QnaReplyVO;
import com.tripleJ.gg88.repository.QnaReplyDAO;

@Controller
public class QnaReplyController {
	
	@Autowired
	QnaReplyDAO qnaReplyDAO;
	
	@RequestMapping("qna/qnaReplyInsert")
	@ResponseBody
	public void qnaInsert(HttpSession session, QnaReplyVO qnaReplyVO) {
		qnaReplyDAO.qnaReplyInsert(qnaReplyVO);
	}
	
	@RequestMapping("qna/reReplyInsert")
	@ResponseBody
	public void reReplyInsert(HttpSession session, QnaReplyVO qnaReplyVO) {
		qnaReplyDAO.reReplyInsert(qnaReplyVO);
	}

}
