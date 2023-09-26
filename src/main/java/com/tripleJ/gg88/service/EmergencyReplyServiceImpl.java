package com.tripleJ.gg88.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripleJ.gg88.domain.EmergencyReply;
import com.tripleJ.gg88.repository.EmergencyReplyRepository;

@Service
public class EmergencyReplyServiceImpl {
	private final EmergencyReplyRepository repository;

	@Autowired
	public EmergencyReplyServiceImpl(EmergencyReplyRepository repository) {
		super();
		this.repository = repository;
	}
	
	public List<EmergencyReply> getAllReplay(int emergencyId) {
		return repository.findAllReply(emergencyId);
	}
	
	public void insertComment(int emergencyId, String comment, HttpServletRequest request) {
		EmergencyReply reply = new EmergencyReply();
		reply.setMemberNo(getMemberNo(request));
		reply.setEmergencyId(emergencyId);
		reply.setContent(comment);
		
		repository.insertComment(reply);
	}
	
	public int getMemberNo(HttpServletRequest request) {
		Object no = request.getSession().getAttribute("memberNo");
		return (int) no;
	}
}
