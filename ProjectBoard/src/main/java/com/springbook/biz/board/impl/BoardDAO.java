package com.springbook.biz.board.impl;

import com.springbook.biz.board.BoardVO;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
  
	public void insertBoard(BoardVO vo) {					//게시물 등록
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
  
	public void updateBoard(BoardVO vo) {					//게시물 업데이트
		mybatis.update("BoardDAO.updateBoard", vo);
	}
  
	public void deleteBoard(BoardVO vo) {					//게시물 삭제
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
  
	public void getBoardCnt(BoardVO vo) {					//게시물 조회수
		mybatis.update("BoardDAO.getBoardCnt", vo);
	}
  
	public BoardVO getBoard(BoardVO vo) {					//게시물 상세보기	
		return (BoardVO)mybatis.selectOne("BoardDAO.getBoard", vo);
	}
  
	public List<BoardVO> getBoardList(BoardVO vo) {			//게시물 목록 보기
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}
  
	public int getBoardListCnt(BoardVO vo) {				//게시물 총 개수 구하기
		return (Integer)mybatis.selectOne("BoardDAO.getBoardListCnt", vo);
	}
}
