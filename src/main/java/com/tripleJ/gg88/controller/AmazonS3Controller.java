package com.tripleJ.gg88.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripleJ.gg88.service.AmazonS3Service;

@Controller
@RequestMapping("amazonS3/*")
public class AmazonS3Controller {
	
	@Autowired
	AmazonS3Service amazonService;
	
	@RequestMapping("profileUpload")
	public String profileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		return amazonService.profileUpload(file, request);
	}
	
	@RequestMapping(value = "/boardUpload", method = RequestMethod.POST)
	@ResponseBody
	public String boardFileUpload(MultipartHttpServletRequest multiRequest, HttpServletRequest request) {
		return amazonService.boardFileUpload(multiRequest, request);
	}
	
}
