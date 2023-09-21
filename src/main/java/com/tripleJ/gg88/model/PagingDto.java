package com.tripleJ.gg88.model;

public class PagingDto {
	private int currentPageNo; //현재 페이지 
	private int recordCountPerPage; //한 페이지 당 보이는 게시물 갯수
	private final int pageSize = 10; //페이지 리스트에 표현되는 페이지 갯수
	private int totalRecordCount; //전체 게시물 수
	private int realEnd; //페이지 마지막 숫자
	
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public int getTotalRecordCount() {
		return totalRecordCount;
	}
	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}
	
	public int getRealEnd() {
		return realEnd;
	}
	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}
	
	private int firstPageNoOnPageList; //페이지 리스트의 첫 페이지 번호
	private int lastPageNoOnPageList; //페이지 리스트의 마지막 페이지 번호
	private int firstRecordIndex; //페이징 sql의 조건절에 사용되는 시작 rownum
	
	private boolean xprev; //이전 버튼
	private boolean xnext; //다음 버튼

	public int getFirstPageNoOnPageList() {
		return firstPageNoOnPageList;
	}
	public void setFirstPageNoOnPageList(int firstPageNoOnPageList) {
		this.firstPageNoOnPageList = firstPageNoOnPageList;
	}
	
	public int getLastPageNoOnPageList() {
		return lastPageNoOnPageList;
	}
	
	public void setLastPageNoOnPageList(int lastPageNoOnPageList) {
		this.lastPageNoOnPageList = lastPageNoOnPageList;
	}
	
	public int getFirstRecordIndex() {
		return firstRecordIndex;
	}
	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}
	
	public boolean isXprev() {
		return xprev;
	}
	public void setXprev(boolean xprev) {
		this.xprev = xprev;
	}
	
	public boolean isXnext() {
		return xnext;
	}
	public void setXnext(boolean xnext) {
		this.xnext = xnext;
	}
	
}
