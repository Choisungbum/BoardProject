package com.springbook.biz.user;

public class UserVO {
	private int id;				//회원 고유 번호
	private String userId;		//회원 아이디
	private String password;	//회원 비밀번호
	private String name;		//회원 이름
	private String email;		//이메일
	private String tel;			//전화번호
	private String birth;		//생년월일
	private String sex;			//성별
  
	
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
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", userId=" + userId + ", password=" + password + ", name=" + name + ", email="
				+ email + ", tel=" + tel + ", birth=" + birth + ", sex=" + sex + "]";
	}

  
}
