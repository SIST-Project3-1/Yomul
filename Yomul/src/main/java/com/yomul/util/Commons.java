package com.yomul.util;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yomul.vo.MemberVO;

public class Commons {

	private static Gson gson = new Gson();

	/**
	 * Gson으로 자바 객체를 Json으로 반환
	 * 
	 * @param src
	 * @return
	 */
	public static String parseJson(Object src) {
		return gson.toJson(src);
	}
	
	// 로그인한 계정의 번호 구하기
	public static String getMno(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		if(member == null) {
			return "";
		}
		
		return member.getNo();
	}
	
	// 페이지네이션 정보를 출력하는 함수
	public static HashMap<String, Integer> getPageInfo(int page, int count, int perPage) {
		HashMap<String, Integer> info = new HashMap<String, Integer>();
		
		info.put("nowPage", page);
		info.put("count", count);
		
		// 전체 페이지 수
		int totalPage = count / perPage;
		if(count % perPage != 0) {
			totalPage ++;
		}
		info.put("totalPage", totalPage);
		
		// 이전 10페이지 버튼 유무 / 있을 시 이전 페이지 값을 가짐
		if(page <= 10) {
			info.put("prev", 0);
		}else {
			info.put("prev", (int)Math.floor(page));
		}
		
		// 다음 10페이지 버튼 유무 / 있을 시 다음 페이지 값을 가짐
		if(page > Math.floor(totalPage - 1) || totalPage <= 10) {
			info.put("next", 0);
		}else {
			info.put("next", (int)Math.ceil(page) + 1);
		}
		
		// 맨 처음 버튼 유무
		if(page == 1 || count == 0) {
			info.put("first", 0);
		}else {
			info.put("first", 1);
		}
		
		// 맨 뒤 버튼 유무
		if(page == totalPage || count == 0) {
			info.put("last", 0);
		}else {
			info.put("last", 1);
		}
		
		// 보여지는 첫 숫자
		int start = page / 10 + 1;
		info.put("start", start);
		
		// 보여지는 마지막 숫자
		if(totalPage - totalPage % 10 > page) {
			info.put("end", start + 9);
		}else {
			info.put("end", totalPage);
		}
		
		return info;
	}
	
	// 페이지네이션 정보를 불러오는 함수 - 첫 페이지
	public static HashMap<String, Integer> getPageInfo(int count, int perPage) {
		return getPageInfo(1, count, perPage);
	}
}
