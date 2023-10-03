package com.tripleJ.gg88.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.services.s3.model.PutObjectResult;

public interface AmazonS3Service {

	String getUuidFileName(String originalFilename);
	
	String profileUpload(@RequestParam("file") MultipartFile file , HttpServletRequest request);
	
	PutObjectResult upload(MultipartFile multiPartFile, String storedFileName, String bucket) throws Exception;
	
	String boardFileUpload(MultipartHttpServletRequest multiRequest, HttpServletRequest request);
}
