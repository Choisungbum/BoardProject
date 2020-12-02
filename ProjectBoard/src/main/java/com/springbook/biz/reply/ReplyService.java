package com.springbook.biz.reply;

import java.util.List;

public interface ReplyService {
	List<ReplyVO> getReplyList(int paramInt);
  
	void insertReply(ReplyVO vo);
  
	void updateReply(ReplyVO vo);
  
	void deleteReply(ReplyVO vo);
}
