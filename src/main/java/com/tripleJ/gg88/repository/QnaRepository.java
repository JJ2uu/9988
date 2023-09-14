package com.tripleJ.gg88.repository;

import java.util.List;

import com.tripleJ.gg88.domain.Page;
import com.tripleJ.gg88.domain.Qna;

public interface QnaRepository {
	
	int qnaInsert(Qna qnaVO);
	
	List<Qna> qnaList(Page page);
	
	Qna qnaDetail(int qnaId) ;
	
	void qnaUpdate(Qna qnaVO);
	
	void qnaDelete(Qna qnaVO);
	
	int countAll();
	
	int qnaViews(int qnaId);
	
	int replyCount(int qnaId);
	
	List<Qna> userQnaList(int memberNo);

}