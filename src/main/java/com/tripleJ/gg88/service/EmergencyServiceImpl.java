package com.tripleJ.gg88.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.model.PagingDto;
import com.tripleJ.gg88.repository.EmergencyRepository;

@Service
public class EmergencyServiceImpl implements EmergencyService {
	private final EmergencyRepository repository;

	@Autowired
	public EmergencyServiceImpl(EmergencyRepository repository) {
		this.repository = repository;
	}
	
	@Override
	public int saveBoard(Emergency emergency, int memberNo) {
		emergency.setMemberNo(memberNo);
		emergency.setIsYn(0);
		return repository.save(emergency);
	}
	
	@Override
	public int temporarySave(Emergency emergency, int memberNo) {
		emergency.setMemberNo(memberNo);
		emergency.setIsYn(1);
		return repository.temporarySave(emergency);
	}
	
	@Override
	public Emergency findById(int emergencyId) {
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

	@Override
	public int getTotalCount() {
		return repository.getTotalCount();
	}

	@Override
	public PagingDto paganation(int currentNum) {
		PagingDto dto = new PagingDto();
		
		dto.setCurrentPageNo(currentNum);
		dto.setTotalRecordCount(getTotalCount());
		
		setRealEnd(dto);
		setFirstPage(dto);
		setLastPage(dto);
		setFirstRecordIndex(dto);
		dto.setRecordCountPerPage(dto.getFirstRecordIndex() + 12);
		setXprevXnext(dto);
		
		return dto;
	}
	
	private void setRealEnd(PagingDto dto) {
		dto.setRecordCountPerPage(12);
		int realEnd = (int)(Math.ceil((dto.getTotalRecordCount() * 1.0) / dto.getRecordCountPerPage()));
		dto.setRealEnd(realEnd);
	}
	
	private void setFirstPage(PagingDto dto) {
		int lastPageNoOnPageList = (int)(Math.ceil(dto.getCurrentPageNo()/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		dto.setFirstPageNoOnPageList(firstPageNoOnPageList);
	}
	
	private void setLastPage(PagingDto dto) {
		int lastPageNoOnPageList = (int)(Math.ceil(dto.getCurrentPageNo()/10.0)) * 10;
		int realEnd = (int)(Math.ceil((dto.getTotalRecordCount() * 1.0) / dto.getRecordCountPerPage()));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		dto.setLastPageNoOnPageList(lastPageNoOnPageList);
	}
	
	private void setFirstRecordIndex(PagingDto dto) {
		int firstRecordIndex = (dto.getCurrentPageNo() - 1) * dto.getRecordCountPerPage();
		dto.setFirstRecordIndex(firstRecordIndex);
	}
	
	private void setXprevXnext(PagingDto dto) {
		boolean xprev= dto.getFirstPageNoOnPageList() > 1;
		dto.setXprev(xprev);
		
		boolean xnext = dto.getLastPageNoOnPageList() < dto.getRealEnd();
		dto.setXnext(xnext);
	}
	
	@Override
	public List<Emergency> getList(PagingDto pagingDto){
		return repository.getList(pagingDto);
	}
	
}
