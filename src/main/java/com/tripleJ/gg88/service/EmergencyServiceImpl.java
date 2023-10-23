package com.tripleJ.gg88.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		String imgFilePath = "http://zdvkzxzhpbmk19765281.cdn.ntruss.com/" + emergency.getImgFile() + "?type=f&w=240&h=180&ttype=jpg";
		emergency.setImgFile(imgFilePath);
		return repository.save(emergency);
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
	public int updateBoard(Emergency emergency, HttpServletRequest request) {
		Object no = request.getSession().getAttribute("memberNo");
		emergency.setMemberNo((int) no);
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
		dto.setRecordCountPerPage(12);
		
		setRealEnd(dto);
		setFirstPage(dto);
		setLastPage(dto);
		setFirstRecordIndex(dto);
		setLastRecordIndex(dto);
		setXprevXnext(dto);
		
		return dto;
	}
	
	private void setRealEnd(PagingDto dto) {
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
	
	private void setLastRecordIndex(PagingDto dto) {
		dto.setLastRecordIndex(dto.getFirstRecordIndex() + 12);
		if(dto.getTotalRecordCount() < dto.getLastRecordIndex()) {
			dto.setLastRecordIndex(dto.getTotalRecordCount());
		}
	}
	
	@Override
	public List<Emergency> getList(int first, int last){
		PagingDto dto = new PagingDto();
		dto.setFirstRecordIndex(first);
		dto.setLastRecordIndex(last);
		return repository.getList(dto);
	}
	
	@Override
	public int getMemberNo(String userNickName) {
		return repository.getMemberNo(userNickName);
	}
	
	@Override
	public List<Emergency> search(String keyword) {
		List<Emergency> emergencys = repository.findAll();
		List<Emergency> result = new ArrayList<>();
		for(Emergency emergency : emergencys) {
			if(emergency.getTitle().contains(keyword)) {
				result.add(emergency);
			}
		}
		
		return result;
	}

}
