package com.tripleJ.gg88.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class BcryptServiceImpl implements BcryptService {

	@Autowired
	BCryptPasswordEncoder encoder;
	
	/* 비밀번호 암호화 */
	public String encode(String userPw) {
		String pwBcrypt = encoder.encode(userPw);
		return pwBcrypt;
	}
	
	/* 비밀번호 암호호 매칭 */
	public boolean match(String rawPassword, String encodedPassword) {
		boolean match = encoder.matches(rawPassword, encodedPassword);
		return match;
	}
	
}

