package com.springbook.biz.board.impl;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
 
	@Autowired
	private BoardDAO boardDAO;
  
	public void insertBoard(BoardVO vo) {				//게시물 등록
		boardDAO.insertBoard(vo);
	}
  
	public void updateBoard(BoardVO vo) {				//게시물 수정
		boardDAO.updateBoard(vo);
	}
  
	public void deleteBoard(BoardVO vo) {				//게시물 삭제
		boardDAO.deleteBoard(vo);
	}
  
	public void getBoardCnt(BoardVO vo) {				//조회수
		boardDAO.getBoardCnt(vo);
	}
  
	public BoardVO getBoard(BoardVO vo) {				//게시물 상세보기
		return boardDAO.getBoard(vo);
	}
  
	public List<BoardVO> getBoardList(BoardVO vo) {		//게시물 목록 보기
		return boardDAO.getBoardList(vo);
	}
  
	public int getBoardListCnt(BoardVO vo) {			//총 게시물수
		return boardDAO.getBoardListCnt(vo);
	}
}
