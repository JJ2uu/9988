package com.tripleJ.gg88.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.repository.EmergencyRepository;

@Service
public class EmergencyServiceImpl implements EmergencyService {
	private final EmergencyRepository repository;

	@Autowired
	public EmergencyServiceImpl(EmergencyRepository repository) {
		this.repository = repository;
	}
	
	@Override
	public int saveBoard(Emergency emergency, HttpServletRequest request) {
		Object id = request.getAttribute("userId");
		emergency.setIsYn(0);
		return repository.save(emergency);
	}
	
	@Override
	public int temporarySave(Emergency emergency) {
		emergency.setIsYn(1);
		return repository.temporarySave(emergency);
	}
	
	@Override
	public List<Emergency> findById(int emergencyId) {
		return repository.findById(emergencyId);
	}
	
	@Override
	public List<Emergency> findAllBoard(){
		return repository.findAll();
	}
	
	@Override
	public int updateBoard(Emergency emergency) {
		return repository.updateBoard(emergency);
	}
	
	@Override
	public int incrementCommendCount(int emergencyId) {
		return repository.incrementCommendCount(emergencyId);
	}
	
	@Override
	public int deleteBoard(int emergencyId) {
		return repository.deleteBoard(emergencyId);
	}
}
