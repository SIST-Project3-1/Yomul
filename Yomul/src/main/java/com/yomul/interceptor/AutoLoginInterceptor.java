package com.yomul.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yomul.util.Cookies;
import com.yomul.vo.MemberVO;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {

	/**
	 * 자동 로그인 처리
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		// 자동 로그인 쿠기 존재 유무 확인
		Cookies cookies = new Cookies(request);
		Cookie autoLogin = cookies.getCookie("autoLogin");

		// 세션 가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		Boolean autoLoginFlag = (Boolean) session.getAttribute("autoLoginFlag");

		// 로그인 되어있으면, 로그인 페이지 접근 불가
		if (autoLoginFlag == null && vo == null && autoLogin != null) {
			session.setAttribute("autoLoginFlag", true);
			response.sendRedirect("/yomul/login");
			return false;
		}
		return true;
	}
}
