package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JoinController {

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "user/join/join";
	}
}
