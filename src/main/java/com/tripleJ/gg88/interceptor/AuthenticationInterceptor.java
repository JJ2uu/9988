package com.tripleJ.gg88.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.tripleJ.gg88.domain.MemberVO;
import com.tripleJ.gg88.service.MemberService;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	
	@Inject
	MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if (loginCookie != null) {
            MemberVO memberVO = memberService.checkSessionKey(loginCookie.getValue());
            if (memberVO != null) {
            	session.setAttribute("userId", memberVO.getId());
            	session.setAttribute("userNick", memberVO.getNickname());
            }
        }
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
