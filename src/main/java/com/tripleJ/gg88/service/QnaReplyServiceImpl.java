package com.tripleJ.gg88.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.QnaReply;
import com.tripleJ.gg88.repository.QnaReplyRepository;
import com.tripleJ.gg88.repository.QnaRepository;

@Service
public class QnaReplyServiceImpl implements QnaReplyService{
	
	@Autowired
	QnaReplyRepository qnaReplyRepo;
	
	@Autowired
	QnaRepository qnaRepo;
	
	public void qnaInsert(HttpSession session, QnaReply qnaReplyVO) {
		qnaReplyRepo.qnaReplyInsert(qnaReplyVO);
	}
	
	public void reReplyInsert(HttpSession session, QnaReply qnaReplyVO) {
		qnaReplyRepo.reReplyInsert(qnaReplyVO);
	}
	
	public void reReplyList(HttpSession session,int groupId, Model model) {
		List<QnaReply> reReplyList = qnaReplyRepo.reReplyList(groupId);
		List<String> reReplyWriterList = new ArrayList<>();
		for (QnaReply qnaReply : reReplyList) {
			int replyMemberNo = qnaReply.getMemberNo();
			String replyWriter = qnaRepo.NoToNick(replyMemberNo);
			reReplyWriterList.add(replyWriter);
		}
		
		model.addAttribute("reReplyWriterList", reReplyWriterList);
		model.addAttribute("reReplyList", reReplyList);
	}

}
