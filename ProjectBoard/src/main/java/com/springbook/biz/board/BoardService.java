package com.springbook.biz.board;

import java.util.List;

public interface BoardService {
	
  void insertBoard(BoardVO vo);				//게시물 등록
  
  void updateBoard(BoardVO vo);				//게시물 업데이트
  
  void deleteBoard(BoardVO vo);				//게시물 삭제
  
  void getBoardCnt(BoardVO vo);				//게시물 조회수
  
  BoardVO getBoard(BoardVO vo);				//게시물 상세보기
  
  List<BoardVO> getBoardList(BoardVO vo);	//게시물 목록보기 
  
  int getBoardListCnt(BoardVO vo);			//게시물 총 개수
}
