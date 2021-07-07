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

	@RequestMapping(value = "admin_notice_list", method = RequestMethod.GET)
	public String adminNoticeList() {
		return "admin/customer_center/notice/admin_notice_list";
	}

	@RequestMapping(value = "admin_notice_info", method = RequestMethod.GET)
	public String adminNoticeInfo() {
		return "admin/customer_center/notice/admin_notice_info";
	}

	@RequestMapping(value = "admin_notice_update", method = RequestMethod.GET)
	public String adminNoticeUpdate() {
		return "admin/customer_center/notice/admin_notice_update";
	}

	@RequestMapping(value = "admin_notice_write", method = RequestMethod.GET)
	public String adminNoticeWrite() {
		return "admin/customer_center/notice/admin_notice_write";
	}

	@RequestMapping(value = "admin_qna_list", method = RequestMethod.GET)
	public String adminQnaList() {
		return "admin/customer_center/qna/admin_faq_list";
	}

	@RequestMapping(value = "admin_qna_write", method = RequestMethod.GET)
	public String adminQnaWrite() {
		return "admin/customer_center/qna/admin_faq_write";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("/admin/member/admin_member_list");
		return mv;
	}
}
