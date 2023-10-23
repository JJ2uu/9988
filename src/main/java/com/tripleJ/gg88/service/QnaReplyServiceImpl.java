package com.tripleJ.gg88.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
		List<String> reReplyDates = new ArrayList<>();
		for (QnaReply qnaReply : reReplyList) {
			int replyMemberNo = qnaReply.getMemberNo();
			String replyWriter = qnaRepo.NoToNick(replyMemberNo);
			reReplyWriterList.add(replyWriter);
			String reReplyDate = formattedDate(qnaReply.getDate());
			reReplyDates.add(reReplyDate);
		}
		
		model.addAttribute("reReplyDates", reReplyDates);
		model.addAttribute("reReplyWriterList", reReplyWriterList);
		model.addAttribute("reReplyList", reReplyList);
	}
	
	public String formattedDate(Timestamp originalDate) {
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(originalDate);
	    calendar.add(Calendar.HOUR, -9);
	    Date originalDateTime = calendar.getTime();
	    
	    long timeDifferenceMillis = System.currentTimeMillis() - originalDateTime.getTime();
	    
	    // 1분 이내일 경우
	    if (timeDifferenceMillis < 60000) {
	        return "방금";
	    }
	    
	    // 1시간 이내일 경우
	    if (timeDifferenceMillis < 3600000) {
	        long minutes = timeDifferenceMillis / 60000;
	        return minutes + "분 전";
	    }
	    
	    // 하루 이내일 경우
	    if (timeDifferenceMillis < 86400000) {
	        long hours = timeDifferenceMillis / 3600000;
	        return hours + "시간 전";
	    }
	    
	    // 그 외의 경우
	    SimpleDateFormat format = new SimpleDateFormat("yyyy. MM. dd");
	    return format.format(originalDateTime);
	}

}
