package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {

	@RequestMapping(value = "/buy_list", method = RequestMethod.GET)
	public String buy_list() {
		return "user/mypage/buy_list";
	}

	@RequestMapping(value = "/sell_list", method = RequestMethod.GET)
	public String sell_list() {
		return "user/mypage/sell_list";
	}

	@RequestMapping(value = "/favorite_list", method = RequestMethod.GET)
	public String favorite_list() {
		return "user/mypage/favorite_list";
	}

	@RequestMapping(value = "myprofile_update", method = RequestMethod.GET)
	public String myprofile_update() {
		return "user/mypage/myprofile_update";
	}

	@RequestMapping(value = "myprofile_info", method = RequestMethod.GET)
	public String myprofile_info() {
		return "user/mypage/myprofile_info";
	}
}
