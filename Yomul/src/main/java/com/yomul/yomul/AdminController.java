package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@RequestMapping(value = "admin_faq_list", method = RequestMethod.GET)
	public String adminFaqList() {
		return "admin/customer_center/faq/admin_faq_list";
	}

	@RequestMapping(value = "admin_faq_write", method = RequestMethod.GET)
	public String adminFaqWrite() {
		return "admin/customer_center/faq/admin_faq_write";
	}

	@RequestMapping(value = "admin_faq_update", method = RequestMethod.GET)
	public String adminFaqUpdate() {
		return "admin/customer_center/faq/admin_faq_update";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("/admin/member/admin_member_list");
		return mv;
	}
}
