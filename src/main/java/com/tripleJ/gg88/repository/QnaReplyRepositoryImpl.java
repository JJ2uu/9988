package com.tripleJ.gg88.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripleJ.gg88.domain.QnaReply;

@Repository
public class QnaReplyRepositoryImpl implements QnaReplyRepository{
	
	@Autowired
	SqlSessionTemplate my;
	
	public int qnaReplyInsert(QnaReply qnaReplyVO) {
		return my.insert("qnaReply.qnaReplyInsert", qnaReplyVO);
	}
	
	public List<QnaReply> qnaReplyList(int qnaId){
		return my.selectList("qnaReply.qnaReplyList", qnaId);
	}
	
	public int reReplyInsert(QnaReply qnaReplyVO) {
		return my.insert("qnaReply.reReplyInsert", qnaReplyVO);
	}
	
	public List<QnaReply> reReplyList(int groupId){
		return my.selectList("qnaReply.reReplyList", groupId);
	}
	
	public void qnaDeleteReply(QnaReply qnaReplyVO) {
		my.delete("qnaReply.qnaDeleteReply", qnaReplyVO);
	}
	
	public List<QnaReply> userReplyList(int memberNo) {
		return my.selectList("qnaReply.userReplyList", memberNo);
	}

}