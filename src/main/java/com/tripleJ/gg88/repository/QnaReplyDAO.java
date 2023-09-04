package com.tripleJ.gg88.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tripleJ.gg88.domain.QnaReplyVO;

@Component
public class QnaReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int qnaReplyInsert(QnaReplyVO qnaReplyVO) {
		int result = my.insert("qnaReply.qnaReplyInsert", qnaReplyVO);
		return result;
	}
	
	public List<QnaReplyVO> qnaReplyList(int qnaId){
		List<QnaReplyVO> QnaReplyList = my.selectList("qnaReply.qnaReplyList", qnaId);
		return QnaReplyList;
	}
	
	public int reReplyInsert(QnaReplyVO qnaReplyVO) {
		int result = my.insert("qnaReply.reReplyInsert", qnaReplyVO);
		return result;
	}
	
	public List<QnaReplyVO> reReplyList(int groupId){
		List<QnaReplyVO> QnaReplyList = my.selectList("qnaReply.reReplyList", groupId);
		return QnaReplyList;
	}
	
	

}
