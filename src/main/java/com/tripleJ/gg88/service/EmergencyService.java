package com.tripleJ.gg88.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tripleJ.gg88.domain.Emergency;

public interface EmergencyService {

	int saveBoard(Emergency emergency, HttpServletRequest request);

	int temporarySave(Emergency emergency);

	List<Emergency> findById(int emergencyId);

	List<Emergency> findAllBoard();

	int updateBoard(Emergency emergency);

	int incrementCommendCount(int emergencyId);

	int deleteBoard(int emergencyId);

}