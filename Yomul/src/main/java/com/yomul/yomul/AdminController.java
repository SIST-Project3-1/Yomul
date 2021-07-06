package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	@RequestMapping(value = "admin_faq_list", method = RequestMethod.GET)
	public String customerCenter() {
		return "admin/customer_center/faq/admin_faq_list";
	}
}
