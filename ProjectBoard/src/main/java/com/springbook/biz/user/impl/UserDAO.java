package com.springbook.biz.user.impl;

import com.springbook.biz.user.UserVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
  
	public void insertUser(UserVO vo) {				//회원 가입
		mybatis.insert("UserDAO.insertUser", vo);
	}
  
	public void updateUser(UserVO vo) {				//회원 수정
		mybatis.update("UserDAO.updateUser", vo);
	}
  
	public void deleteUser(UserVO vo) {				//회원 삭제
		mybatis.delete("UserDAO.deleteUser", vo);
	}
	
	public int selectLoginId(UserVO vo) {			//아이디 확인
		return (Integer)mybatis.selectOne("UserDAO.selectLoginId", vo);
	}
  
	public UserVO selectLoginUser(UserVO vo) {		//로그인
		return (UserVO)mybatis.selectOne("UserDAO.selectLoginUser", vo);
	}
}
