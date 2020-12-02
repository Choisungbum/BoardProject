package com.springbook.biz.board;

public class Pagination {
  private int pageSize = 10;		//한 페이지당 불러올 게시물 수
  private int rangeSize = 10;		//한 블록당 불러올 페이지 수
  private int curPage = 1;			//현재 페이지
  private int curRange = 1;			//현재 블록
  private int listCnt;				//총게시물
  private int pageCnt;				//페이수 수
  private int rangeCnt;				//블록 수
  private int startPage = 1;		//시작 페이지 
  private int endPage = 1;			//마지막 페이지
  private int startIndex = 0;		//시작 인덱스
  private int prevPage;				//이전 페이지
  private int nextPage;				//다음 페이지
  
  public int getPageSize() {
    return pageSize;
  }
  
  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }
  
  public int getRangeSize() {
    return rangeSize;
  }
  
  public void setRangeSize(int rangeSize) {
    this.rangeSize = rangeSize;
  }
  
  public int getCurPage() {
    return curPage;
  }
  
  public void setCurPage(int curPage) {
    this.curPage = curPage;
  }
  
  public int getCurRange() {
    return curRange;
  }
  
  public void setCurRange(int curPage) {				
    this.curRange = (curPage - 1) / this.rangeSize + 1;
  }
  
  public int getListCnt() {
    return listCnt;
  }
  
  public void setListCnt(int listCnt) {
    this.listCnt = listCnt;
  }
  
  public int getPageCnt() {
    return pageCnt;
  }
  
  public void setPageCnt(int listCnt) {					
    this.pageCnt = (int)Math.ceil(listCnt * 1.0D / pageSize);
  }
  
  public int getRangeCnt() {
    return rangeCnt;
  }
  
  public void setRangeCnt(int pageCnt) {
    this.rangeCnt = (int)Math.ceil(pageCnt * 1.0D / rangeSize);
  }
  
  public int getStartPage() {
    return startPage;
  }
  
  public void setStartPage(int startPage) {
    this.startPage = startPage;
  }
  
  public int getEndPage() {
    return endPage;
  }
  
  public void setEndPage(int endPage) {
    this.endPage = endPage;
  }
  
  public int getStartIndex() {
    return startIndex;
  }
  
  public void setStartIndex(int curPage) {
    this.startIndex = (curPage - 1) * this.pageSize;
  }
  
  public int getPrevPage() {
    return prevPage;
  }
  
  public void setPrevPage(int prevPage) {
    this.prevPage = prevPage;
  }
  
  public int getNextPage() {
    return nextPage;
  }
  
  public void setNextPage(int nextPage) {
    this.nextPage = nextPage;
  }
  
  public Pagination(int listCnt, int curPage) {			//생설자를 이용하여 초기화
    setCurPage(curPage);
    setListCnt(listCnt);
    setPageCnt(listCnt);
    setRangeCnt(this.pageCnt);
    rangeSetting(curPage);
    setStartIndex(curPage);
  }
  
  public void rangeSetting(int curPage) {
    setCurRange(curPage);
    this.startPage = (curRange - 1) * rangeSize + 1;
    this.endPage = startPage + rangeSize - 1;
    if (endPage > pageCnt)
    	endPage = pageCnt; 
    prevPage = curPage - 1;
    nextPage = curPage + 1;
  }
}
