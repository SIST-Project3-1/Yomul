package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TownController {

	@RequestMapping(value = "town_list", method = RequestMethod.GET)
	public String town_list() {
		return "user/town/town_list";
	}
	@RequestMapping(value = "town_write", method = RequestMethod.GET)
	public String town_write() {
		return "user/town/town_write";
	}
	@RequestMapping(value = "town_update", method = RequestMethod.GET)
	public String town_update() {
		return "user/town/town_update";
	}
}
