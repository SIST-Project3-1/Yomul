package com.yomul.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.FaqDAO;
import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDAO faqDAO;
	
	@Override
	public int getAdminFaqWrite(FaqVO faq) {
		return faqDAO.getAdminFaqWrite(faq) == 1 ? 1 : 0;
	}

	@Override
	public ArrayList<FaqVO> getAdminFaqList(int page, String search) {
		return faqDAO.getAdminFaqList(page, search);
	}

	@Override
	public int getTotalPageFaq(String search) {
		return faqDAO.getTotalPageFaq(search);
	}

	@Override
	public ArrayList<CategoryVO> updateFaqCategories(int  categoryNo) {
		return faqDAO.updateFaqCategories(categoryNo);
	}
	
	@Override
	public FaqVO getAdminFaqUpdateData(String no) {
		return faqDAO.getAdminFaqUpdateData(no);
	}

	@Override
	public int getAdminFaqUpdate(FaqVO faq) {
		return faqDAO.getAdminFaqUpdate(faq);
	}


}
