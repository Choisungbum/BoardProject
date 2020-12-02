package com.springbook.biz.reply.impl;

import com.springbook.biz.reply.ReplyVO;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("replyDAO")
public class ReplyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
  
	public List<ReplyVO> getReplyList(int bno) {				//댓글 목록
		return mybatis.selectList("ReplyDAO.getReplyList", bno);
	}
  
	public void insertReply(ReplyVO vo) {						//댓글 등록
		mybatis.insert("ReplyDAO.insertReply", vo);
	}
  
	public void updateReply(ReplyVO vo) {						//댓글 수정
	  mybatis.update("ReplyDAO.updateReply", vo);
	}
  
	public void deleteReply(ReplyVO vo) {						//댓글 삭제
		mybatis.delete("ReplyDAO.deleteReply", vo);
	}
}
