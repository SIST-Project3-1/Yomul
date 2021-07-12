package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.NoticeVO;

public interface CustomerCenterService {
	ArrayList<CategoryVO> getFaqCategories();

	ArrayList<FaqVO> getFaqList();

	ArrayList<NoticeVO> getNoticeList();

	NoticeVO getNoticeInfo(int no);

	int addNoticeHits(int no);

	ArrayList<String> getNoticeFiles(int no);

	ArrayList<CategoryVO> getQnaCategories();
}
