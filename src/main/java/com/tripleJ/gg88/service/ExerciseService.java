package com.tripleJ.gg88.service;

import java.util.List;

import com.tripleJ.gg88.domain.Exercise;

public interface ExerciseService {

	List<Exercise> search(String search) throws Exception;

	List<Exercise> getList(String response, String search) throws Exception;

}