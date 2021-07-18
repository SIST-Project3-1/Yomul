package com.yomul.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.FaqDAO;
import com.yomul.vo.FaqVO;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDAO faqDAO;
	
	@Override
	public int getAdminFaqWrite(FaqVO faq) {
		return faqDAO.getAdminFaqWrite(faq) == 1 ? 1 : 0;
	}


}
