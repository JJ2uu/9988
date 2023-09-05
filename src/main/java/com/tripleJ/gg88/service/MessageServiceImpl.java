package com.tripleJ.gg88.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MailAuthService authService;

	public String sendTo(String phoneNumber) {
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("API Key", "API Secret", "https://api.coolsms.co.kr");
	
		String authNum = Integer.toString(authService.makeRandomNumber());
		Message message = new Message();
		message.setFrom("발신 번호");
		message.setTo(phoneNumber);
		message.setText("[9988]본인확인 인증번호 [" + authNum + "]를 화면에 입력해주세요.");
		
		try {
			// send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}
		
		return authNum;
	};
}
