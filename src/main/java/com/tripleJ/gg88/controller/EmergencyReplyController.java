package com.tripleJ.gg88.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.domain.EmergencyReply;
import com.tripleJ.gg88.repository.EmergencyReplyRepository;
import com.tripleJ.gg88.repository.EmergencyReplyRepositoryImpl;

@Controller
@RequestMapping("emergencyReply/*")
public class EmergencyReplyController {
	//좋아요 db 파티셔닝 필요
	private final EmergencyReplyRepository service; //현재 리포지토리 연결 서비스로 변경해야 함
	@Autowired
	public EmergencyReplyController(EmergencyReplyRepositoryImpl service) {
		this.service = service;
	}
	
	@RequestMapping("/")
	public void finadAll() {
		
	}

	// 좋아요 버튼 클릭 처리 
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	@ResponseBody
	public String likeConfirm(@RequestBody EmergencyReply reply) {
		int like = reply.getCommend_count(); // 서비스에서 카운트 로직 필요
		// JSON으로 값이 들어오기 때문에 @RequestBody와 커맨드 객체를 사용해서 JSON 타입을 객첼 변경 
		System.out.println("/snsBoard/like : POST ");
		System.out.println("좋아요 기능 값을 가져오는지 확인 : " + like);
			
		// 좋아요 버튼은 버튼이 하나임으로 버튼을 클릭 유무에 따라 좋아요 선택 및 취소를 뜻
			
		int result = service.searchCommend(like);
		// 좋아요를 눌렀다면 1이 오고 좋아요를 누르지 않았다면 0이 옴 
			
		if(result == 0) {
			// 좋아요를 누르지 않았다면 해당 정보를 db에 저장 
			service.createCommendCount();
			return "like";
		}
		else {
			// 좋아요를 눌렀으므로 db에서 해당 값 삭제 
			service.deleteCommend(like);
			return "delete";
			}
		}
		
		// 회원이 글 목록 진입시 좋아요 게시물 수 체크 
		@RequestMapping(value = "/listLike", method = RequestMethod.POST)
		@ResponseBody
		public List<Emergency> listLike(@RequestBody String memberNo){
			System.out.println("/snsBoard/listLike : POST");
			System.out.println("좋아요 게시물 체크 : " + memberNo);
			
			List<Emergency> likeList = service.listLike(memberNo);
			System.out.println(likeList);
			return likeList;
			
		}
}
