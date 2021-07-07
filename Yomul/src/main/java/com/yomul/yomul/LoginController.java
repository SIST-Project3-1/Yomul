package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.secret.Secret;

@Controller
public class LoginController {

	@RequestMapping(value = "kakao_login", method = RequestMethod.GET)
	public ModelAndView kakao_login() {
		ModelAndView mv = new ModelAndView("redirect:https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=" + Secret.KAKAO_API_KEY
				+ "&redirect_uri=http://localhost:9000/yomul/kakao_login_proc");
		return mv;
	}

	@RequestMapping(value = "kakao_login_proc", method = RequestMethod.GET)
	public ModelAndView kakao_login_proc(String code) {
		ModelAndView mv = new ModelAndView("redirect:/");
		System.out.println(code);
		return mv;
	}

	@RequestMapping(value = "reset_password", method = RequestMethod.GET)
	public ModelAndView reset_password() {
		ModelAndView mv = new ModelAndView("user/login/reset_password");
		return mv;
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "user/login/login";
	}
}
