package com.tripleJ.gg88.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.model.PagingDto;

public interface EmergencyService {
	public static final String IMAGE_REPO="C:/spring/image_repo";

	int saveBoard(Emergency emergency, int memberNo);

	Emergency findById(int emergencyId);

	List<Emergency> findAllBoard();

	int updateBoard(Emergency emergency, HttpServletRequest request);

	int incrementCommendCount(int emergencyId);

	int deleteBoard(int emergencyId);
	
	int getTotalCount();
	
	PagingDto paganation(int currentNum);
	
	public List<Emergency> getList(int first, int last);
	
	public int getMemberNo(String userId);
}