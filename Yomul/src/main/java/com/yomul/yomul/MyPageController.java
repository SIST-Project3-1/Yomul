package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

//	회원 탈퇴 페이지
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public ModelAndView withdrawal() {
		ModelAndView mv = new ModelAndView("user/mypage/withdrawal");
		return mv;
	}

	@RequestMapping(value = "/myarticle_list", method = RequestMethod.GET)
	public ModelAndView myacticle_list() {
		ModelAndView mv = new ModelAndView("user/mypage/myarticle_list");
		mv.addObject("headerType", "myarticle");
		return mv;
	}

	@RequestMapping(value = "/mycomment_list", method = RequestMethod.GET)
	public ModelAndView mycomment_list() {
		ModelAndView mv = new ModelAndView("user/mypage/mycomment_list");
		mv.addObject("headerType", "myarticle");
		return mv;
	}

	@RequestMapping(value = "/buy_list", method = RequestMethod.GET)
	public ModelAndView buy_list() {
		ModelAndView mv = new ModelAndView("user/mypage/buy_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	@RequestMapping(value = "/sell_list", method = RequestMethod.GET)
	public ModelAndView sell_list() {
		ModelAndView mv = new ModelAndView("user/mypage/sell_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	@RequestMapping(value = "/favorite_list", method = RequestMethod.GET)
	public ModelAndView favorite_list() {
		ModelAndView mv = new ModelAndView("user/mypage/favorite_list");
		mv.addObject("headerType", "buy_list");
		return mv;
	}

	@RequestMapping(value = "myprofile_update", method = RequestMethod.GET)
	public ModelAndView myprofile_update() {
		ModelAndView mv = new ModelAndView("user/mypage/myprofile_update");
		mv.addObject("headerType", "myprofile");
		return mv;
	}

	@RequestMapping(value = "myprofile_info", method = RequestMethod.GET)
	public ModelAndView myprofile_info() {
		ModelAndView mv = new ModelAndView("user/mypage/myprofile_info");
		mv.addObject("headerType", "myprofile");
		return mv;
	}
}
