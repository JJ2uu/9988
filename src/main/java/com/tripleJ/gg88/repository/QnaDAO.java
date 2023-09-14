package com.tripleJ.gg88.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tripleJ.gg88.domain.Page;
import com.tripleJ.gg88.domain.Qna;

@Component
public class QnaDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int qnaInsert(Qna qnaVO) {
		int result = my.insert("qna.qnaInsert", qnaVO);
		return result;
	}
	
	public List<Qna> qnaList(Page page){
		List<Qna> qnaList = my.selectList("qna.qnaList", page);
		return qnaList;
	}
	
	public Qna qnaDetail(int qnaId) {
		Qna qnaVO = my.selectOne("qna.qnaDetail", qnaId);
		return qnaVO;
	}
	
	public void qnaUpdate(Qna qnaVO) {
		my.update("qna.qnaUpdate", qnaVO);
	}
	
	public void qnaDelete(Qna qnaVO) {
		my.delete("qna.qnaDelete", qnaVO);
	}
	
	public int countAll() {
		return my.selectOne("qna.count");
	}
	
	public int qnaViews(int qnaId) {
		return my.update("qna.qnaViews", qnaId);
	}
	
	public int replyCount(int qnaId) {
		return my.update("qna.replyCount", qnaId);
	}
	
	public List<Qna> userQnaList(int memberNo) {
		List<Qna> userQnaList = my.selectList("qna.userQnaList", memberNo);
		return userQnaList;
	}

}