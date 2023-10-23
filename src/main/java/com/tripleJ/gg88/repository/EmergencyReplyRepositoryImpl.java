package com.tripleJ.gg88.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.domain.EmergencyReply;

@Repository
public class EmergencyReplyRepositoryImpl implements EmergencyReplyRepository {
	String namespace = "emergencyReply.";
	public final SqlSessionTemplate sql;
	public EmergencyReplyRepositoryImpl(SqlSessionTemplate sql) {
		super();
		this.sql = sql;
	}
	
	@Override
	public void insertComment(EmergencyReply reply) {
		sql.insert(namespace + "insertComment", reply);
	}
	
	@Override
	public List<EmergencyReply> findAllReply(int emergencyId) {
		return sql.selectList(namespace + "findAllReply", emergencyId);
	}
	
	@Override
	public void updateReply(EmergencyReply reply) {
		sql.update(namespace + "updateReply" + reply);
	}
	
	@Override
	public void deleteReply(EmergencyReply reply) {
		int emergencyId = reply.getEmergencyId();
		sql.delete(namespace + "deleteReply" + emergencyId);
	}
	
	@Override
	public void searchCommend(EmergencyReply reply) {
		int commendCount = reply.getCommend_count();
		sql.selectList(namespace + "searchCommend" + commendCount);
	}
	
	//추천수 관련 메서드 4개
	@Override
	public void createCommendCount() {
		
	}
	
	@Override
	public int searchCommend(int like) {
		return 0;
	}
	
	@Override
	public void deleteCommend(int like) {
		
	}
	
	@Override
	public List<Emergency> listLike(String memberNo) {
		return sql.selectList(memberNo);
	}
	
}
