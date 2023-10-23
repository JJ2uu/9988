package com.tripleJ.gg88.repository;

import java.util.List;

import com.tripleJ.gg88.domain.Exercise;
import com.tripleJ.gg88.model.PagingDto;

public interface ExerciseRepository {

	int saveInfo(Exercise exercise);

	List<Exercise> selectKeyword(String category);
	
	int searchData(String category);
	
	List<Exercise> getList(PagingDto dto);
}