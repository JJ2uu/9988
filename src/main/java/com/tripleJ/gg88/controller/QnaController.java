package com.tripleJ.gg88.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {
	@RequestMapping("qna/qnaBoard")
	public String qnaBoard() {
		return "qna/qnaBoard";
	}
	@RequestMapping("qna/qnaCreate")
	public String qnaCreate() {
		return "qna/qnaCreate";
	}
	@RequestMapping("qna/qnaContent")
	public String qnaContent() {
		return "qna/qnaContent";
	}
}
