package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	@RequestMapping(value = "total_search", method = RequestMethod.GET)
	public ModelAndView total_search(String target) {
		ModelAndView mv = new ModelAndView("user/total_search");

		mv.addObject("target", target);
		return mv;
	}
}
