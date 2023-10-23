package com.tripleJ.gg88.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tripleJ.gg88.domain.Qna;

public interface QnaRepository {
	
	int qnaInsert(Qna qnaVO);
	
	List<Qna> qnaList();
	
	Qna qnaDetail(int qnaId) ;
	
	void qnaUpdate(Qna qnaVO);
	
	void qnaDelete(Qna qnaVO);
	
	int countAll();
	
	int qnaViews(int qnaId);
	
	int replyCount(int qnaId);
	
	List<Qna> userQnaList(int memberNo);
	
	String NoToNick(int memberNo);
	
	List<Qna> searchAll(String search);
	
	List<Qna> categorySearch(HashMap<String, String> map);
	
	List<Qna> userQnaKeywordSearch(Map<String, Object> userDataMap);

}