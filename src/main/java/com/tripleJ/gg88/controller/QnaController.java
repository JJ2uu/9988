package com.tripleJ.gg88.controller;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.domain.QnaReplyVO;
import com.tripleJ.gg88.domain.QnaVO;
import com.tripleJ.gg88.repository.QnaDAO;
import com.tripleJ.gg88.repository.QnaReplyDAO;

@Controller
public class QnaController {
	
	@Autowired
	QnaDAO qnaDAO;
	
	@Autowired
	QnaReplyDAO qnaReplyDAO;
	
	@RequestMapping("qna/qnaBoard")
	public String qnaBoard(Model model) {
		List<QnaVO> qnaList = qnaDAO.qnaList();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> formattedDates = new ArrayList<>();
		
		for (QnaVO qnaVO : qnaList) {
	        Timestamp timestamp = qnaVO.getDate(); // qnaVO에서 날짜 가져오기
	        String formattedDate = dateFormat.format(new Date(timestamp.getTime()));
	        formattedDates.add(formattedDate);
	    }
		model.addAttribute("formattedDates", formattedDates);
		model.addAttribute("qnaList", qnaList);
		return "qna/qnaBoard";
	}
	@RequestMapping("qna/qnaCreate")
	public String qnaCreate() {
		return "qna/qnaCreate";
	}
	@RequestMapping("qna/qnaContent")
	public void qnaContent(HttpSession session, int qnaId, Model model) {
		QnaVO qnaVO = qnaDAO.qnaDetail(qnaId);
		List<QnaReplyVO> qnaReplyList = qnaReplyDAO.qnaReplyList(qnaId);
		model.addAttribute("qnaVO", qnaVO);
		model.addAttribute("qnaReplyList", qnaReplyList);
	}
	
	@RequestMapping("qna/qnaInsert")
	@ResponseBody
	public void qnaInsert(HttpSession session, QnaVO qnaVO) {
		qnaDAO.qnaInsert(qnaVO);
	}
	
	@RequestMapping("qna/qnaIdCheck")
	public void qnaIdCheck(HttpSession session, int qnaId, Model model) {
		QnaVO qnaVO = qnaDAO.qnaDetail(qnaId);
		model.addAttribute("qnaVO", qnaVO);
	}
	
	@RequestMapping("qna/qnaUpdate")
	@ResponseBody
	public void qnaUpdate(HttpSession session, QnaVO qnaVO) {
		qnaDAO.qnaUpdate(qnaVO);
	}
	
	@RequestMapping("qna/qnaDelete")
	@ResponseBody
	public void qnaDelecte(HttpSession session, QnaVO qnaVO) {
		qnaDAO.qnaDelete(qnaVO);
	}
	
	
}
