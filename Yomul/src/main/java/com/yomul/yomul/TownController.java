package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TownController {

	@RequestMapping(value = "town_list", method = RequestMethod.GET)
	public String home_list() {
		return "user/town/town_list";
	}
}
