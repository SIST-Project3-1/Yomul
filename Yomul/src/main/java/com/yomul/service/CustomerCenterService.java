package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;

public interface CustomerCenterService {
	
	public ArrayList<CategoryVO> getFaqCategories();
	public ArrayList<FaqVO> getFaqList();
	public ArrayList<FaqVO> getFaqList(int category);
}
