package com.tripleJ.gg88.repository;

import java.util.List;

import com.tripleJ.gg88.domain.Emergency;

public interface EmergencyRepository {
	int save(Emergency emergency); //저장
	
	int temporarySave(Emergency emergency); //임시 저장
	
	List<Emergency> findById(int memberNo); //아이디로 게시판 검색
	
	List<Emergency> findAll(); //전체 리스트
	
	int updateBoard(Emergency emergency); // 게시판 수정
	
	int incrementCommendCount(int emergencyId);
	
	int deleteBoard(int emergencyId); //게시판 삭제
}