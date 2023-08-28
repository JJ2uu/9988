package com.tripleJ.gg88.service;

public interface MailAuthService {

	int makeRandomNumber();
	
	String joinEmail(String email, String type);
	
	void mailSend(String message, String email, String title);
}
