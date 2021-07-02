package com.yomul.yomul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeListController {

	@RequestMapping(value = "customer_notices", method = RequestMethod.GET)
	public String customerCenter() {
		return "user/customer_center/notice/notice_list";
	}
}