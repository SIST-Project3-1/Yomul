package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "product_write", method = RequestMethod.GET)
	public String product_write() {
		return "user/home/product_write";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String pruduct_list() {
		return "user/home/product_list";
	}

}