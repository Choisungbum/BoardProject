package com.springbook.biz.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller("userController")
@SessionAttributes("user")
public class UserController {
	@Autowired
	private UserService userService;
  
	@RequestMapping(value = "/insertUser.do", method = RequestMethod.GET)		//회원가입 페이지
	public String insertUserView(UserVO vo) {
		return "insertUser.jsp";
	}
  
	@RequestMapping(value = "/insertUser.do", method = RequestMethod.POST)		//회원가입
	public String insertUser(UserVO vo, Model model, HttpServletRequest req) {				
		String email1 = req.getParameter("email1");							//이메일 로컬파트
		String email2 = req.getParameter("email2");							//도메인파트 : 직접입력
		String email3 = req.getParameter("email3");							//도메인파트 : 셀렉박스에서 선택
		String ema = email1 +"@";											//이메일 전체주소값		
		if(email2 == null) {
			ema +=email3;
		}
		else if(email2 != null) {
			ema +=email2;
		}
		int idChk = userService.selectLoginId(vo);
		
		if(idChk == 1) {													//중복되는 ID가 있을 경우
			return "insertUser.jsp";
		} 
		else if(idChk == 0) {												//중복되는 ID가 없는 경우
			vo.setEmail(ema);
			userService.insertUser(vo);
			model.addAttribute("user", userService.selectLoginUser(vo));
		}
		return "redirect:getBoardList.do";
	}
  
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)			//로그인 페이지
	public String getUserView(UserVO vo) {
		return "login.jsp";
	}
  
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)			//로그인 + 아이디를 가져오는 sql쿼리문생성
	public String getUser(UserVO vo, Model model) {
		Map<String,Boolean> errors = new HashMap<>();
		model.addAttribute("errors",errors);
		if(userService.selectLoginId(vo) == 1) { 								//id가 존재할 경우
			if (userService.selectLoginUser(vo) != null) { 						//비밀번호가 일치할 경우
				model.addAttribute("user", userService.selectLoginUser(vo));
				return "redirect:getBoardList.do";
				}
			else {
				errors.put("pass",Boolean.TRUE);
				return "login.jsp";
			}
		} 		
		errors.put("id",Boolean.TRUE);
		return "login.jsp";
	}
	
	@RequestMapping(value = "/loginIdCheck.do")									//아이디 중복검사 
	@ResponseBody
	public int loginIdCheck(UserVO vo,  @RequestBody Map<String, Object> checkId) {
		String userId = (String)checkId.get("userId");
		vo.setUserId(userId);
		return userService.selectLoginId(vo);
	}
  
	@RequestMapping("/userMgm.do")												//회원관리 페이지 
	public String userMgm(UserVO vo, Model model) {
		return "userMgm.jsp";
	}
  
	@RequestMapping(value = "/updateUser.do", method = RequestMethod.GET)		//회원수정 페이지
	public String updateUserView(@ModelAttribute("user") UserVO vo, Model model) {
		Map<String, String> email = new HashMap<>();
		String str = vo.getEmail();
		String[] emails = str.split("@");
		email.put("email1",emails[0]);
		email.put("email2",emails[1]);
		model.addAttribute("email",email);
		return "updateUser.jsp";
	}
  
	@RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)		//회원수정 
	public String updateUser(@ModelAttribute("user") UserVO vo, Model model, HttpServletRequest req) {
		String email1 = req.getParameter("email1");							//이메일 로컬파트
		String email2 = req.getParameter("email2");							//도메인파트 : 직접입력
		String email3 = req.getParameter("email3");							//도메인파트 : 셀렉박스에서 선택
		String ema = email1 +"@";											//이메일 전체주소값		
		if(email2 == null) {
			ema +=email3;
		}
		else if(email2 != null) {
			ema +=email2;
		}
		vo.setEmail(ema);
		userService.updateUser(vo);
		model.addAttribute("user", userService.selectLoginUser(vo));
		return "redirect:getBoardList.do";
	}
  
	@RequestMapping("/deleteUser.do")											//회원삭제
	public String deleteUser(@ModelAttribute("user") UserVO vo, SessionStatus sessionStatus) {
		userService.deleteUser(vo);
		sessionStatus.setComplete();
		return "redirect:getBoardList.do";
	}
  
	@RequestMapping("/logout.do")												//로그아웃(쿠키삭제)
	public String logout(HttpServletRequest req, HttpServletResponse res, SessionStatus sessionStatus) {
		sessionStatus.setComplete(); 			//세션에서 값을 수동으로 제거 
		Cookie[] cookies = req.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(int i=0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("viewCookie")) {
					Cookie cookie = new Cookie("viewCookie","");
					cookie.setMaxAge(0);
					res.addCookie(cookie);
				}
			}
		}
		return "redirect:getBoardList.do";
	}

}
