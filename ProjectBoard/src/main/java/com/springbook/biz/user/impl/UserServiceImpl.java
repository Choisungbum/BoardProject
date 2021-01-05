package com.springbook.biz.user.impl;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
  
	public void insertUser(UserVO vo) {			//회원가입
		userDAO.insertUser(vo);
	}
  
	public void updateUser(UserVO vo) {			//회원 수정
		userDAO.updateUser(vo);
	}
  
	public void deleteUser(UserVO vo) {			//회원 삭제
		userDAO.deleteUser(vo);
	}
	
	public int selectLoginId(UserVO vo) {		//아이디 확인
		return userDAO.selectLoginId(vo);
	}
  
	public UserVO selectLoginUser(UserVO vo) {	//로그인
		return userDAO.selectLoginUser(vo);
	}
}
