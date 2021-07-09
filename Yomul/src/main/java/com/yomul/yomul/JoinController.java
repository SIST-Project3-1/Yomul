package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinController {

	/**
	 * 회원가입 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "user/join/join";
	}

	/**
	 * 이메일 중복 확인
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/email_check", method = RequestMethod.GET)
	public String email_check(String email) {
		return "1";
	}
}
