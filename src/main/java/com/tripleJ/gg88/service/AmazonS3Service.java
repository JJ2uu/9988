package com.tripleJ.gg88.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.services.s3.model.PutObjectResult;

public interface AmazonS3Service {

	String getUuidFileName(String originalFilename);
	
	String profileUpload(MultipartHttpServletRequest multiRequest, HttpServletRequest request);
	
	PutObjectResult upload(MultipartFile multiPartFile, String storedFileName) throws Exception;
	
	String boardFileUpload(MultipartHttpServletRequest multiRequest, HttpServletRequest request);
}
