package com.tripleJ.gg88.repository;

import java.util.List;
import java.util.Map;

import com.tripleJ.gg88.domain.QnaReply;

public interface QnaReplyRepository {
	
	int qnaReplyInsert(QnaReply qnaReplyVO);
	
	List<QnaReply> qnaReplyList(int qnaId);
	
	int reReplyInsert(QnaReply qnaReplyVO);
	
	List<QnaReply> reReplyList(int groupId);
	
	void qnaDeleteReply(QnaReply qnaReplyVO);
	
	List<QnaReply> userReplyList(int memberNo);
	
	List<QnaReply> userReplyKeywordSearch(Map<String, Object> userDataMap);

}