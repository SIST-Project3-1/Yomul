package com.yomul.yomul;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.VendorService;
import com.yomul.vo.VendorVO;

@Controller
public class VendorController {
	@Autowired
	private VendorService vendorService;
	
	//업체 등록
	@RequestMapping(value="/vendor_signup", method=RequestMethod.GET)
	public String vendor_signup() {
		return "user/near/vendor_signup";
	}
	
	// 업체 등록 처리
	@ResponseBody
	@RequestMapping(value="/vendor_signup_proc", method=RequestMethod.POST)
	public String vendor_signup_proc(VendorVO vo, HttpServletRequest request) {
		vo.setNo("M3"); // 임시 테스트용
//		HttpSession session = request.getSession();
//		vo.setNo((String)session.getAttribute("id"));
		
		int result = vendorService.vendorSignUp(vo);
		
		return String.valueOf(result);
	}
	
	//업체 프로필 보기
	@RequestMapping(value = "/vendor_profile_info", method = RequestMethod.GET)
	public ModelAndView vendor_profile_info() {
		ModelAndView mv = new ModelAndView("user/near/vendor_profile_info");
		mv.addObject("headerType", "profile");
		return mv;
	}
	
	//업체 프로필 수정
	@RequestMapping(value = "/vendor_profile_update", method = RequestMethod.GET)
	public ModelAndView vendor_profile_update() {
		ModelAndView mv = new ModelAndView("user/near/vendor_profile_update");
		mv.addObject("headerType", "profile");
		return mv;
	}
	
	//업체 단골
	@RequestMapping(value = "/vendor_profile_follow", method = RequestMethod.GET)
	public ModelAndView vendor_profile_follow() {
		ModelAndView mv = new ModelAndView("user/near/vendor_profile_follow");
		mv.addObject("headerType", "profile");
		return mv;
	}
		
	//업체 소식 보기
	@RequestMapping(value = "/vendor_news_list", method = RequestMethod.GET)
	public ModelAndView vendor_news_list() {
		ModelAndView mv = new ModelAndView("user/near/vendor_news_list");
		mv.addObject("headerType", "news");
		return mv;
	}
	
	//업체 소식 작성
	@RequestMapping(value = "/vendor_news_insert", method = RequestMethod.GET)
	public ModelAndView vendor_news_insert() {
		ModelAndView mv = new ModelAndView("user/near/vendor_news_insert");
		mv.addObject("headerType", "news");
		return mv;
	}
	
	//업체 소식 수정
	@RequestMapping(value = "/vendor_news_update", method = RequestMethod.GET)
	public ModelAndView vendor_news_update() {
		ModelAndView mv = new ModelAndView("user/near/vendor_news_update");
		mv.addObject("headerType", "news");
		return mv;
	}
	
	//업체 후기
	@RequestMapping(value = "/vendor_reviews", method = RequestMethod.GET)
	public ModelAndView vendor_reviews() {
		ModelAndView mv = new ModelAndView("user/near/vendor_reviews");
		return mv;
	}
	

	
	
}
