package com.tripleJ.gg88.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {
	@RequestMapping("qna/qnaBoard")
	public String qnaBoard() {
		return "qna/qnaBoard";
	}
	@RequestMapping("qna/qnaCreate")
	public void qnaCreate() {
	}
	@RequestMapping("qna/qnaContent")
	public void qnaContent() {
	}
}
