package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NearController {
	//내 근처 기본화면
	@RequestMapping(value="/near_home", method=RequestMethod.GET)
	public String near_home() {
		return "user/near/near_home";
	}
	
	//내 근처 글 쓰기
	@RequestMapping(value="/near_write", method=RequestMethod.GET)
	public String near_write() {
		return "user/near/near_write";
	}
	
	//내 근처 글 수정
	@RequestMapping(value="/near_update", method=RequestMethod.GET)
	public String near_update() {
		return "user/near/near_update";
	}
	
	//내 근처 글 목록
	@RequestMapping(value="/near_list", method=RequestMethod.GET)
	public String near_list() {
		return "user/near/near_list";
	}
	
	//내 근처 글 상세보기
	@RequestMapping(value="/near_info", method=RequestMethod.GET)
	public String near_info() {
		return "user/near/near_info";
	}
	
	//내 근처 업체등록
	@RequestMapping(value="/vendor_signup", method=RequestMethod.GET)
	public String vendor_signup() {
		return "user/near/vendor_signup";
	}
	
}
