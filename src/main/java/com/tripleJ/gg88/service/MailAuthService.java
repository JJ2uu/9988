package com.tripleJ.gg88.service;

public interface MailAuthService {

	int makeRandomNumber();
	
	String joinEmail(String email);
	
	void mailSend(String message, String email, String title);
}
