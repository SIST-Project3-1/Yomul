package com.yomul.yomul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.dao.NearDAO;
import com.yomul.vo.NearVO;

@Controller
public class NearController {
	
	@Autowired
	private NearDAO dao;
	
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
	
	@RequestMapping(value="/near_write_proc", method=RequestMethod.POST)
	public ModelAndView near_write_proc(NearVO vo) {
		int result;
		ModelAndView mv = new ModelAndView();
		NearDAO dao = new NearDAO();
		
		result = dao.getNearWrite(vo);
		if(result==1) {
			
			mv.setViewName("redirect:/near_home");
			
		}else {
			// mv.setViewName("error"); 에러페이지
		}
		
		
		return mv;
	}
	
	//�궡 洹쇱쿂 湲� �닔�젙 (�룞�꽕援ъ씤援ъ쭅, 怨쇱쇅/�겢�옒�뒪, �냽�닔�궛臾�, 以묎퀬李�)
	
	@RequestMapping(value="/near_update", method=RequestMethod.GET)
	public String near_update() {
		return "user/near/near_update";
	}
	
	
	@RequestMapping(value="/near_info", method=RequestMethod.GET)
	public String near_info() {
		return "user/near/near_info";
	}
	
	
	@RequestMapping(value="/near_news_form", method=RequestMethod.GET)
	public String near_news_form() {
		return "user/near/near_news_form";
	}
	
	
	@RequestMapping(value="/near_card_form", method=RequestMethod.GET)
	public String near_card_form() {
		return "user/near/near_card_form";
	}
	
	@RequestMapping(value="/reviews_info", method=RequestMethod.GET)
	public String reviews_info() {
		return "user/near/reviews_info";
	}
	
}
