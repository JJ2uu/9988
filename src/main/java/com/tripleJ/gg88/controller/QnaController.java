package com.tripleJ.gg88.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.domain.QnaReply;
import com.tripleJ.gg88.domain.Qna;
import com.tripleJ.gg88.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qnaService;
	
	@RequestMapping("qna/qnaBoard")
	public String qnaBoard(Model model) {
		return qnaService.qnaBoard(model);
	}
	
	@RequestMapping("qna/qnaPage")
	public void qnaPage(@RequestParam(required = true) int page, int pageSize, Model model) {
		qnaService.qnaPage(page, pageSize, model);
	}
	
	@RequestMapping("qna/qnaCreate")
	public String qnaCreate() {
		return qnaService.qnaCreate();
	}
	
	@RequestMapping("qna/qnaContent")
	public void qnaContent(HttpSession session, int qnaId, Model model) {
		qnaService.qnaContent(session, qnaId, model);
		
	}
	
	@RequestMapping("qna/qnaInsert")
	@ResponseBody
	public void qnaInsert(HttpSession session, Qna qnaVO) {
		qnaService.qnaInsert(session, qnaVO);
	}
	
	@RequestMapping("qna/qnaIdCheck")
	public void qnaIdCheck(HttpSession session, int qnaId, Model model) {
		qnaService.qnaIdCheck(session, qnaId, model);
	}
	
	@RequestMapping("qna/qnaUpdate")
	@ResponseBody
	public void qnaUpdate(HttpSession session, Qna qnaVO) {
		qnaService.qnaUpdate(session, qnaVO);
	}
	
	@RequestMapping("qna/qnaDelete")
	@ResponseBody
	public void qnaDelete(HttpSession session, Qna qnaVO, QnaReply qnaReplyVO) {
		qnaService.qnaDelete(session, qnaVO, qnaReplyVO);
	}
	
	@RequestMapping("qna/qnaViews")
	@ResponseBody
	public void qnaViews(int qnaId) {
		qnaService.qnaViews(qnaId);
	}
	
	@RequestMapping("qna/replyCount")
	@ResponseBody
	public void replyCount(HttpSession session, int qnaId) {
		qnaService.replyCount(session, qnaId);
	}
	
	@RequestMapping("qna/NickToNo")
	@ResponseBody
	public int NickToNo(String nickname) {
		return qnaService.NickToNo(nickname);
	}
	
	@RequestMapping("qna/searchAllPage")
	public void searchAllPage(@RequestParam(required = true) int page, int pageSize, String search, Model model) {
		qnaService.searchAllPage(page, pageSize, search, model);
	}
	@RequestMapping("qna/categorySearchPage")
	public void categorySearchPage(@RequestParam(required = true) int page, int pageSize, String search, String category, Model model) {
		qnaService.categorySearchPage(page, pageSize, search, category, model);
	}
	
	
}
