package com.tripleJ.gg88.service;

public interface BcryptService {

	String encode(String userPw);
	
	boolean match(String rawPassword, String encodedPassword);
}
