package com.springbook.biz.user;

public class UserVO {
	private int id;				//회원 고유 번호
	private String userId;		//회원 아이디
	private String password;		//회원 비밀번호
	private String name;			//회원 이름
	private String role;			//회원 직급
  
	public int getId() {
		return id;
	}
  
	public void setId(int id) {
		this.id = id;
	}
  
	public String getUserId() {	
		return userId;
	}
  
	public void setUserId(String userId) {
		this.userId = userId;
	}
  
	public String getPassword() {
		return password;
	}
  
	public void setPassword(String password) {
		this.password = password;
	}
  
	public String getName() {
		return name;
	}
  
	public void setName(String name) {
		this.name = name;
	}
  
	public String getRole() {
		return role;
	}
  
	public void setRole(String role) {
		this.role = role;
	}
  
	public String toString() {
		return "UserVO [id=" + id + ", userId=" + userId + ", password=" + password + ", name=" + name + ", role=" + role + "]";
	}
}
