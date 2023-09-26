package com.tripleJ.gg88.repository;

import java.util.List;

import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.domain.EmergencyReply;

public interface EmergencyReplyRepository {

	void insertComment(EmergencyReply reply);

	List<EmergencyReply> findAllReply(int emergencyId);

	void updateReply(EmergencyReply reply);

	void deleteReply(EmergencyReply reply);

	void searchCommend(EmergencyReply reply);

	//추천수 관련 메서드 4개
	void createCommendCount();

	int searchCommend(int like);

	void deleteCommend(int like);

	List<Emergency> listLike(String memberNo);

}