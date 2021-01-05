package com.springbook.biz.user;

public interface UserService {
	void insertUser(UserVO vo);
  
	void updateUser(UserVO vo);
  
	void deleteUser(UserVO vo);
	
	int selectLoginId(UserVO vo);
  
	UserVO selectLoginUser(UserVO vo);
}
