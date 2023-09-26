package com.tripleJ.gg88.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripleJ.gg88.domain.Member;
import com.tripleJ.gg88.domain.Qna;

@Repository
public class QnaRepositoryImpl implements QnaRepository {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int qnaInsert(Qna qnaVO) {
		return my.insert("qna.qnaInsert", qnaVO);
	}
	
	public List<Qna> qnaList(){
		return my.selectList("qna.qnaList");
	}
	
	public Qna qnaDetail(int qnaId) {
		return my.selectOne("qna.qnaDetail", qnaId);
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
		return my.selectList("qna.userQnaList", memberNo);
	}
	
	public String NoToNick(int memberNo) {
		Member member = my.selectOne("member.noToNick", memberNo);
		String writer = member.getNickname();
		return writer;
	}
	
	public List<Qna> searchAll(String search){
		return my.selectList("qna.searchAll", search);
	}
	
	public List<Qna> categorySearch(HashMap<String, String> map){
		return my.selectList("qna.categorySearch", map);
	}
	
	public List<Qna> userQnaKeywordSearch(Map<String, Object> userDataMap) {
		return my.selectList("qna.keywordSearch", userDataMap);
	}

}