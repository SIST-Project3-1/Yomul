package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerCenterController {

	@RequestMapping(value = "customer_center", method = RequestMethod.GET)
	public String customerCenter() {
		return "user/customer_center/faq/faq_list";
	}
}