package com.tripleJ.gg88.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripleJ.gg88.domain.Exercise;
import com.tripleJ.gg88.model.PagingDto;

@Repository
public class ExerciseRepositoryImpl implements ExerciseRepository {
	final String namespace = "exercise.";
	public final SqlSessionTemplate sql;
	
	@Autowired
	public ExerciseRepositoryImpl(SqlSessionTemplate sql) {
		super();
		this.sql = sql;
	}
	
	@Override
	public int saveInfo(Exercise exercise) {
		return sql.insert(namespace + "saveInfo", exercise);
	}
	
	@Override
	public List<Exercise> selectKeyword(String category){
		return sql.selectList(namespace + "selectAll", category);
	}

	@Override
	public int searchData(String category) {
		return sql.selectOne(namespace + "searchData", category);
	}

	@Override
	public List<Exercise> getList(PagingDto dto) {
		return sql.selectList(namespace+"getList", dto);
	}
	
}
