package com.yomul.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yomul.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	/**
	 * 로그인 확인
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		// 세션 가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");

		// 로그인 되어있으면, 로그인 페이지 접근 불가
		if (vo != null) {
			response.sendRedirect("/yomul/");
			return false;
		}
		return true;
	}
}
