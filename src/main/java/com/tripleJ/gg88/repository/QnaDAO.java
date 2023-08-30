package com.tripleJ.gg88.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tripleJ.gg88.domain.QnaVO;

@Component
public class QnaDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int qnaInsert(QnaVO qnaVO) {
		int result = my.insert("qna.qnaInsert", qnaVO);
		return result;
	}
	
	public List<QnaVO> qnaList(){
		List<QnaVO> qnaList = my.selectList("qna.qnaList");
		return qnaList;
	}
	
	public QnaVO qnaDetail(int qnaId) {
		QnaVO qnaVO = my.selectOne("qna.qnaDetail", qnaId);
		return qnaVO;
	}
	
	public void qnaUpdate(QnaVO qnaVO) {
		my.update("qna.qnaUpdate", qnaVO);
	}
	
	public void qnaDelete(QnaVO qnaVO) {
		my.delete("qna.qnaDelete", qnaVO);
	}
	

}
