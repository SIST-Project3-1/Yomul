package com.yomul.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yomul.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	/**
	 * 로그인 확인
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		// 세션 가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");

		// 세션 체크 후 있으면 무 --> 로그인 페이지
		if (vo == null) {
			response.sendRedirect("/yomul/");
			return false;
		} else if (!vo.getAuthority().equals("ADMIN")) {
			response.sendRedirect("/yomul/");
			return false;
		}
		return true;
	}
}
