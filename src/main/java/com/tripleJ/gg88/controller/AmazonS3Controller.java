package com.tripleJ.gg88.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripleJ.gg88.service.AmazonS3Service;

@Controller
@RequestMapping("amazonS3/*")
public class AmazonS3Controller {
	
	@Autowired
	AmazonS3Service amazonService;
	
	@RequestMapping("profileUpload")
	@ResponseBody
	public String profileUpload(MultipartHttpServletRequest multiRequest, HttpServletRequest request) {
		return amazonService.profileUpload(multiRequest, request);
	}
	
}
