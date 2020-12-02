package com.springbook.biz.reply;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReplyVO {
	private int rno;						//댓글 번호
	private int bno;						//게시물 번호
	private String replytext;				//댓글 내용
	private String replyer;				//댓글 작성자
	private Date regDate = new Date();	//댓글 등록 시간
  
	public int getRno() {
		return rno;
	}
  
	public void setRno(int rno) {
		this.rno = rno;
	}
  
	public int getBno() {
		return bno;
	}
  
	public void setBno(int bno) {
		this.bno = bno;
	}
  
	public String getReplytext() {
		return replytext;
	}
  
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
  
	public String getReplyer() {
		return replyer;
	}
  
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
  
	public Date getRegDate() {	 
		return regDate;		
	}
  
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
  
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer + 
			", regDate=" + regDate + "]";
	}
}
