package com.tripleJ.gg88.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.model.PagingDto;

public interface EmergencyService {

	int saveBoard(Emergency emergency, int memberNo);

	int temporarySave(Emergency emergency, int memberNo);

	Emergency findById(int emergencyId);

	List<Emergency> findAllBoard();

	int updateBoard(Emergency emergency);

	int incrementCommendCount(int emergencyId);

	int deleteBoard(int emergencyId);
	
	int getTotalCount();
	
	PagingDto paganation(int currentNum);
	
	public List<Emergency> getList(PagingDto pagingDto);
}