package com.springbook.biz.controller;

import com.springbook.biz.reply.ReplyService;
import com.springbook.biz.reply.ReplyVO;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReplyController {
	@Autowired
	private ReplyService replyService;
  
	@RequestMapping("/insertReply.do")								//댓글 등록, @RequestBody를 이용하여 json형식의 데이터를 받아옴
	public void insertReply(ReplyVO vo, @RequestBody Map<String, Object> reply) {
		int bno = (int)reply.get("bno");
		String replytext = (String)reply.get("replytext");
		String replyer = (String)reply.get("replyer");
		vo.setBno(bno);
		vo.setReplytext(replytext);
		vo.setReplyer(replyer);
		vo.getRegDate();
		replyService.insertReply(vo);
	}
  
	@RequestMapping("/getReplyList.do")								//댓글 목록보기
	public List<ReplyVO> getReplyList(int bno, Model model) {
		List<ReplyVO> replyList = replyService.getReplyList(bno);
		model.addAttribute("replyList", replyList);
		return replyList;
	}
  
	@RequestMapping("/updateReply.do")								//댓글 수정
	public void updateReply(ReplyVO vo, @RequestBody Map<String, Object> reply) {
		int bno = (int)reply.get("bno");
		int rno = (int)reply.get("rno");
		String replytext = (String)reply.get("replytext");
		vo.setBno(bno);
		vo.setRno(rno);
		vo.setReplytext(replytext);
		replyService.updateReply(vo);
	}
  
	@RequestMapping("/deleteReply.do")								//댓글 삭제
	public void deleteReply(ReplyVO vo, @RequestBody Map<String, Object> reply) {
		int bno = (int)reply.get("bno");
		int rno = (int)reply.get("rno");
		vo.setBno(bno);
		vo.setRno(rno);
		replyService.deleteReply(vo);
	}
}
