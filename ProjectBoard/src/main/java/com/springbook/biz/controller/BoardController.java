package com.springbook.biz.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.Pagination;

@Controller("boardController")
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
  
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)		//게시물 등록 페이지 이동
	public String insertBoardView(BoardVO vo) {
		return "insertBoard.jsp";
	}
  
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)		//게시물 등록
	public String insertBoard(BoardVO vo) {
		boardService.insertBoard(vo);
		return "redirect:getBoardList.do";
	}
  
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.GET)		//게시물 업데이트 페이지 이동
	public String updateboardView(@ModelAttribute("board") BoardVO vo) {					 
	  	return "updateBoard.jsp";
	}
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.POST)		//게시물 업데이트
	public String updateboard(@ModelAttribute("board") BoardVO vo) {					 
		boardService.updateBoard(vo);
	  	return "redirect:getBoardList.do";
	}
  
	@RequestMapping("/deleteBoard.do")											//게시물 삭제
	public String deleteBoard(@ModelAttribute("board") BoardVO vo) {			
		boardService.deleteBoard(vo);
		return "redirect:getBoardList.do";
	}
  
	@RequestMapping("/getBoard.do")												//게시물 상세보기(쿠키를 추가해 조회수 새로고침해도 못 올라가게 함)
	public String getBoard(BoardVO vo, Model model, HttpServletRequest req, HttpServletResponse res) {
		String cseq = req.getParameter("seq");	
		Cookie[] cookies = req.getCookies();
		Cookie cntCookie = null;
		if(cookies != null && cookies.length > 0) {
			for(int i=0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("viewCookie")) {
					cntCookie = cookies[i];
				}
			}
		}
		if(cntCookie==null) {
			Cookie newCookie = new Cookie("viewCookie","|"+cseq+"|");
			res.addCookie(newCookie);
			boardService.getBoardCnt(vo);
		} 
		else {
			String value = cntCookie.getValue();	
			if(value.indexOf("|"+cseq+"|") < 0) {
				value += "|"+cseq+"|";
				cntCookie.setValue(value);
				res.addCookie(cntCookie);
				boardService.getBoardCnt(vo);
			}
		}

		model.addAttribute("board", boardService.getBoard(vo));
		return "getBoard.jsp";
	}
  
	@RequestMapping("/getBoardList.do")											//게시물 목록 보기(페이징, 검색목록)
	public String getBoardList(BoardVO vo, Model model, @RequestParam(defaultValue = "1") int curPage) {
		if (vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");	//검색목록 초기설정 
		if (vo.getSearchKeyword() == null) vo.setSearchKeyword("");  
    
		int listCnt = boardService.getBoardListCnt(vo);							//총 게시물 수 
    
		Pagination pagination = new Pagination(listCnt, curPage);				//페이지 초기설정
		vo.setStartIndex(pagination.getStartIndex());
		vo.setCntPerPage(pagination.getPageSize());
    
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardList",boardService.getBoardList(vo));
		return "getBoardList.jsp";
	}
  
	@ModelAttribute("conditionMap")												//게시물 검색목록 조건 설정, @ModelAttribute => @ReauestMapping보다 먼저 호출되며, 
	public Map<String, String> searchConditionMap() {							//메서드 실행결과는 자동으로 Model에 저장된다.
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용 ", "CONTENT");
		conditionMap.put("작성자", "WRITER");
		return conditionMap;
	}
}
