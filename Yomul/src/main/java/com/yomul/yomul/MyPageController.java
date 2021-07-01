package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {

	@RequestMapping(value = "myprofile_info", method = RequestMethod.GET)
	public String myprofile_info() {
		return "user/mypage/myprofile_info";
	}
}
