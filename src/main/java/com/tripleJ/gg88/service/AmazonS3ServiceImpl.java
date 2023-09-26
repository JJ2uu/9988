package com.tripleJ.gg88.service;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.amazonaws.util.IOUtils;
import com.tripleJ.gg88.domain.Member;
import com.tripleJ.gg88.repository.MemberRepository;

@PropertySource("classpath:application.properties")
@Service
public class AmazonS3ServiceImpl implements AmazonS3Service {
	
	@Autowired
	private AmazonS3 s3Client;
	
	@Autowired
	MemberRepository memberRepo;
	
	@Value("${profileBucket}")
	private String bucket;
	
	public PutObjectResult upload(MultipartFile multiPartFile, String storedFileName) throws Exception {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		String filePath = storedFileName;
		byte[] bytes = IOUtils.toByteArray(multiPartFile.getInputStream());
		objectMetadata.setContentLength(bytes.length);
		ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
		
		PutObjectRequest putObjectRequest = new PutObjectRequest(bucket, filePath, byteArrayInputStream, objectMetadata);
		
		return s3Client.putObject(putObjectRequest);
	}
	
	public String profileUpload(MultipartHttpServletRequest multiRequest, HttpServletRequest request) {
		
        MultipartFile mf = multiRequest.getFile("file");
        if (mf != null) {
        	String originalFilename = mf.getOriginalFilename();
			try {
				String encodedFilename = URLEncoder.encode(originalFilename, "UTF-8");
				String uuidFilename = getUuidFileName(encodedFilename);
				String userId = "";
				
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					 for (Cookie cookie : cookies) {
						if (cookie.getName().equals("loginCookie")) {
							String cookieValue = cookie.getValue();
							Member member = memberRepo.checkSessionKey(cookieValue);
							userId = member.getId();
						} else {
							userId = (String) request.getSession().getAttribute("userId");
						}
					}
				} else {
					userId = (String) request.getSession().getAttribute("userId");
				}
				
				Map<String, Object> userDataMap = new HashMap<String, Object>();
	    		userDataMap.put("id", userId);
	    		userDataMap.put("profile", uuidFilename);
	    		memberRepo.profileUpload(userDataMap);
        		upload(mf, uuidFilename);
        		return uuidFilename;
			} catch (Exception e) {
				e.printStackTrace();
				return "fail";
			}
		} else {
			System.out.println("업로드 실패");
			return "fail";
		}
	}
	
	public String getUuidFileName(String originalFilename) {
		return UUID.randomUUID().toString() + "_" + originalFilename;
	}
	
	public String boardFileUpload(MultipartHttpServletRequest multiRequest, HttpServletRequest request) {
		MultipartFile mf = multiRequest.getFile("file");
		System.out.println(mf);
		if (mf != null) {
			String originalFilename = mf.getOriginalFilename();
			try {
				String encodedFilename = URLEncoder.encode(originalFilename, "UTF-8");
				String uuidFilename = getUuidFileName(encodedFilename);
				
				upload(mf, uuidFilename);
				return uuidFilename;
			} catch (Exception e) {
				e.printStackTrace();
				return "fail";
			}
		} else {
			System.out.println("업로드 실패");
			return "fail";
		}
	}

}