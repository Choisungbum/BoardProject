package com.springbook.biz.controller;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller("userController")
@SessionAttributes({"user"})
public class UserController {
	@Autowired
	private UserService userService;
  
	@RequestMapping(value = "/insertUser.do", method = RequestMethod.GET)		//회원가입 페이지
	public String insertUserView(UserVO vo) {
		return "insertUser.jsp";
	}
  
	@RequestMapping(value = "/insertUser.do", method = RequestMethod.POST)	//회원가입
	public String insertUser(UserVO vo, Model model) {
		userService.insertUser(vo);
		model.addAttribute("user", userService.selectLoginUser(vo));
		return "loginSuccess.jsp";
	}
  
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)			//로그인 페이지
	public String getUserView(UserVO vo) {
		return "login.jsp";
	}
  
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)			//로그인
	public String getUser(UserVO vo, Model model) {
		if (userService.selectLoginUser(vo) != null) {
			model.addAttribute("user", userService.selectLoginUser(vo));
			return "loginSuccess.jsp";
		} 
		return "login.jsp";
	}
  
	@RequestMapping("/loginSuccess.do")										//로그인 성공 페이지
	public String loginSuccess(UserVO vo, Model model) {
		model.addAttribute("user", userService.selectLoginUser(vo));
		return "loginSuccess.jsp";
	}
  
	@RequestMapping(value = "/updateUser.do", method = RequestMethod.GET)		//회원수정 페이지
	public String updateUserView(@ModelAttribute("user") UserVO vo) {
		return "updateUser.jsp";
	}
  
	@RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)	//회원수정 
	public String updateUser(@ModelAttribute("user") UserVO vo, Model model) {
		userService.updateUser(vo);
		model.addAttribute("user", userService.selectLoginUser(vo));
		return "loginSuccess.jsp";
	}
  
	@RequestMapping("/deleteUser.do")											//회원삭제
	public String deleteUser(@ModelAttribute("user") UserVO vo, HttpSession session) {
		userService.deleteUser(vo);
		session.invalidate();
		return "login.jsp";
	}
  
	@RequestMapping("/logout.do")												//로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}

}
