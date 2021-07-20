package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;

public interface FaqService {

	int getAdminFaqWrite(FaqVO faq);

	ArrayList<FaqVO> getAdminFaqList(int page, String search);
	
	int getTotalPageFaq(String search);

	ArrayList<CategoryVO> updateFaqCategories(int category_no);

	FaqVO getAdminFaqUpdateData(String no);

	int getAdminFaqUpdate(FaqVO faq);

}
