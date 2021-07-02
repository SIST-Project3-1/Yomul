package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerCenterController {

	@RequestMapping(value = "customer_center", method = RequestMethod.GET)
	public String customerCenter() {
		return "user/customer_center/faq/faq_list";
	}
	
	@RequestMapping(value = "customer_notices", method = RequestMethod.GET)
	public String noticeList() {
		return "user/customer_center/notice/notice_list";
	}
	
	@RequestMapping(value = "customer_notices/{no}", method = RequestMethod.GET)
	public ModelAndView noticeList(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/customer_center/notice/notice_info");
		mv.addObject("no", no);
		
		return mv;
	}
}
