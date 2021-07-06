package com.yomul.yomul;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerCenterController {
	// 문의 카테고리 상수
	public static final int TRADE_TROUBLE = 0; // 거래 환불/분쟁 및 사기 신고
	public static final int USER_INFO = 1; // 계정 문의
	public static final int STUFF = 2; // 판매 금지/거래 품목 문의
	public static final int AFTER_TRADE = 3; // 매너평가, 매너온도, 거래후기 관련 문의
	public static final int POST = 4; // 게시글 노출, 미노출 문의
	public static final int ALARM = 5; // 채팅, 알림 문의
	public static final int HOW_TO = 6; // 앱 사용/거래 방법 문의
	public static final int COMMUNITY = 7; // 동네 생활(커뮤니티) 문의
	public static final int ADVERTISEMENT = 8; // 지역 광고 문의
	public static final int BUSINESS_PROFILE = 9; // 비즈프로필(등록, 이용) 문의
	public static final int SEARCH = 10; // 검색 문의
	public static final int ETC = 11; // 기타 문의
	public static final int ERROR = 12; // 오류 제보
	public static final int SEGGESTION = 13; // 개선/제안
	
	HashMap<Integer, String> categories;
	
	public CustomerCenterController() {
		categories = new HashMap<Integer, String>();
	}
	
	// 고객센터 메인 FAQ
	@RequestMapping(value = "customer_center", method = RequestMethod.GET)
	public String customerCenter() {
		return "user/customer_center/faq/faq_list";
	}
	
	// 공지사항 목록
	@RequestMapping(value = "customer_notices", method = RequestMethod.GET)
	public String noticeList() {
		return "user/customer_center/notice/notice_list";
	}
	
	// 공지사항 상세
	@RequestMapping(value = "customer_notices/{no}", method = RequestMethod.GET)
	public ModelAndView noticeList(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/customer_center/notice/notice_info");
		mv.addObject("no", no);
		
		return mv;
	}
	
	// 문의 목록
	@RequestMapping(value = "customer_qna", method = RequestMethod.GET)
	public String qnaList() {
		return "user/customer_center/qna/qna_list";
	}
	
	
	// 문의 상세
	@RequestMapping(value = "customer_qna/{no}", method = RequestMethod.GET)
	public ModelAndView qnaInfo(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/customer_center/qna/qna_info");
		mv.addObject("no", no);
		
		return mv;
	}
	
	// 문의 작성
	@RequestMapping(value = "customer_qna/write", method = RequestMethod.GET)
	public String qnaWrite() {
		return "user/customer_center/qna/qna_write";
	}
	
	// 관리자 임시 문의 목록
	@RequestMapping(value = "admin/customer_qna", method = RequestMethod.GET)
	public String adminQnaList() {
		return "admin/customer_center/qna/admin_qna_list";
	}
	
	// 관리자 임시 문의 상세
	@RequestMapping(value = "admin/customer_qna/{no}", method = RequestMethod.GET)
	public ModelAndView adminQnaInfo(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/customer_center/qna/admin_qna_write");
		mv.addObject("no", no);
		
		return mv;
	}
}
