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
	
	@RequestMapping(value = "product_update", method = RequestMethod.GET)
	public String product_update() {
		return "user/home/product_update";
	}
	
	@RequestMapping(value = "product_info", method = RequestMethod.GET)
	public String product_info() {
		return "user/home/product_info";
	}

	@RequestMapping(value = "/product_list", method = RequestMethod.GET)
	public String product_list() {
		return "user/home/product_list";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "user/home/product_list";
	}

}
