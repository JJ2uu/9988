package com.tripleJ.gg88.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tripleJ.gg88.domain.QnaReply;

@Component
public class QnaReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int qnaReplyInsert(QnaReply qnaReplyVO) {
		int result = my.insert("qnaReply.qnaReplyInsert", qnaReplyVO);
		return result;
	}
	
	public List<QnaReply> qnaReplyList(int qnaId){
		List<QnaReply> QnaReplyList = my.selectList("qnaReply.qnaReplyList", qnaId);
		return QnaReplyList;
	}
	
	public int reReplyInsert(QnaReply qnaReplyVO) {
		int result = my.insert("qnaReply.reReplyInsert", qnaReplyVO);
		return result;
	}
	
	public List<QnaReply> reReplyList(int groupId){
		List<QnaReply> reReplyList = my.selectList("qnaReply.reReplyList", groupId);
		return reReplyList;
	}
	
	

}
