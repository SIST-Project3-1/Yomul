package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NearController {
	//내 근처 기본화면
	@RequestMapping(value="/near_home", method=RequestMethod.GET)
	public ModelAndView near_home() {
		ModelAndView mv = new ModelAndView();
		
		String keyword[] = { "부동산", "카페", "요가", "휴대폰", "마사지", "미용실", "왁싱" };
		
		mv.setViewName("user/near/near_home");
		mv.addObject("keyword",keyword);
		
		return mv;
	}
	
	//내 근처 글 쓰기 (동네구인구직, 과외/클래스, 농수산물, 중고차)
	@RequestMapping(value="/near_write", method=RequestMethod.GET)
	public String near_write() {
		return "user/near/near_write";
	}
	
	//내 근처 글 수정 (동네구인구직, 과외/클래스, 농수산물, 중고차)
	@RequestMapping(value="/near_update", method=RequestMethod.GET)
	public String near_update() {
		return "user/near/near_update";
	}
	
	//내 근처 글 상세보기
	@RequestMapping(value="/near_info", method=RequestMethod.GET)
	public String near_info() {
		return "user/near/near_info";
	}
	
	//카테고리 폼 - 뉴스
	@RequestMapping(value="/near_news_form", method=RequestMethod.GET)
	public String near_news_form() {
		return "user/near/near_news_form";
	}
	
	//카테고리 폼 - 카드
	@RequestMapping(value="/near_card_form", method=RequestMethod.GET)
	public String near_card_form() {
		return "user/near/near_card_form";
	}
	
	//단골 후기 상세보기
	@RequestMapping(value="/reviews_info", method=RequestMethod.GET)
	public String reviews_info() {
		return "user/near/reviews_info";
	}
	
}
