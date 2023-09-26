package com.tripleJ.gg88.repository;

import java.util.List;

import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.model.PagingDto;

public interface EmergencyRepository {
	int save(Emergency emergency); //저장
	
	Emergency findById(int emergencyId); //아이디로 게시판 검색
	
	List<Emergency> findAll(); //전체 리스트
	
	int updateBoard(Emergency emergency); // 게시판 수정
	
	int incrementCommendCount(int emergencyId);
	
	int deleteBoard(int emergencyId); //게시판 삭제
	
	int getTotalCount();
	
	List<Emergency> getList(PagingDto pagingDto);
	
	public int getMemberNo(String userId); //멤버 번호 찾기
}
