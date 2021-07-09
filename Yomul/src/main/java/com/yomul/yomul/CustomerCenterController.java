package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerCenterController {
	
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
}
