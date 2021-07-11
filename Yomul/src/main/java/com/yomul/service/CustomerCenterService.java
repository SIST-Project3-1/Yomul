package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.NoticeVO;

public interface CustomerCenterService {
	
	public ArrayList<CategoryVO> getFaqCategories();
	
	public ArrayList<FaqVO> getFaqList();
	
	public ArrayList<FaqVO> getFaqList(int category);
	
	public ArrayList<NoticeVO> getNoticeList();
	
	public NoticeVO getNoticeInfo(int no);
	
	public int addNoticeHits(int no);
}
