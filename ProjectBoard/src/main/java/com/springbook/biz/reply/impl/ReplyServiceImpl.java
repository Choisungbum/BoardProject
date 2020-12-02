package com.springbook.biz.reply.impl;

import com.springbook.biz.reply.ReplyService;
import com.springbook.biz.reply.ReplyVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO replyDAO;
  
	public List<ReplyVO> getReplyList(int bno) {	//댓글 목록
		return replyDAO.getReplyList(bno);
	}
  
	public void insertReply(ReplyVO vo) {			//댓글 등록
		replyDAO.insertReply(vo);
	}
  
	public void updateReply(ReplyVO vo) {			//댓글 수정
		replyDAO.updateReply(vo);
	}
  
	public void deleteReply(ReplyVO vo) {			//댓글 삭제
	  replyDAO.deleteReply(vo);
	}
}
