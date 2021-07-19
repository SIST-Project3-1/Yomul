package com.yomul.util;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {
	// Field
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();

	// Constructor
	public Cookies(HttpServletRequest request) { // 객체 생성 시 자동으로 쿠키를 Map에 넣어줌 .
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}

	// Method

	// 쿠키 삭제
	public static Cookie removeCookie(Cookie cookie) {
		cookie.setMaxAge(0);
		return cookie;
	}

	// 특정 이름의 쿠키를 꺼내는 메소드
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}

	// 특정 이름의 쿠키의 값을 꺼내는 메소드
	public String getValue(String name) {
		Cookie cookie = cookieMap.get(name);

		if (cookie == null) {
			return null;
		}
		return cookie.getValue();
	}

	// 해당 쿠키가 존재하는지 확인하는 메소드
	public boolean exists(String name) {
		return cookieMap.get(name) != null;
	}

	// 새로운 쿠키를 생성하는 메소드. 맵에 넣지 않고 생성만 함
	public static Cookie createCookie(String name, String value) {
		return new Cookie(name, value);
	}

	// 쿠키의 유효시간까지 설정하는 메소드
	public static Cookie createCookie(String name, String value, int maxAge) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		return cookie;
	}

	// 쿠키의 유효시간까지 설정하는 메소드
	public static Cookie createCookie(String name, String value, int maxAge, String path) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		cookie.setPath(path);
		return cookie;
	}
}
