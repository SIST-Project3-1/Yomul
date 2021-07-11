package com.yomul.yomul;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.CustomerCenterService;
import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.NoticeVO;

@Controller
public class CustomerCenterController {
	@Autowired
	private CustomerCenterService customerCenterService;
	
	// 고객센터 메인 FAQ - 전체
	@RequestMapping(value = "customer_center", method = RequestMethod.GET)
	public String customerCenter() {
		return "redirect:/customer_center/0";
	}
	
	// 고객센터 메인 FAQ - 카테고리별
	@RequestMapping(value = "customer_center/{category}", method = RequestMethod.GET)
	public ModelAndView customerCenter(@PathVariable("category") int category) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<CategoryVO> categories = customerCenterService.getFaqCategories(); // 카테고리 정보
		ArrayList<FaqVO> faqlist = null;
		
		// faq 목록
		if(category == 0) { // 카테고리 입력이 0일 경우 전체 출력
			faqlist = customerCenterService.getFaqList();
		}else {
			faqlist = customerCenterService.getFaqList(category);
		}
		
		mv.setViewName("user/customer_center/faq/faq_list");
		mv.addObject("categories", categories);
		mv.addObject("faqlist", faqlist);
		
		return mv;
	}
	
	// 공지사항 목록
	@RequestMapping(value = "customer_notices", method = RequestMethod.GET)
	public ModelAndView noticeList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<NoticeVO> list = customerCenterService.getNoticeList();
		
		mv.setViewName("user/customer_center/notice/notice_list");
		mv.addObject("list", list);
		
		return mv;
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
