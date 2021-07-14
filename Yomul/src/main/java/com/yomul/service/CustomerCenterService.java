package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.NoticeVO;
import com.yomul.vo.QnaVO;

public interface CustomerCenterService {
	ArrayList<CategoryVO> getFaqCategories();

	ArrayList<FaqVO> getFaqList();

	ArrayList<NoticeVO> getNoticeList();

	NoticeVO getNoticeInfo(int no);

	int addNoticeHits(int no);

	ArrayList<CategoryVO> getQnaCategories();

	int writeQna(QnaVO vo);

	String getNextQnaNo();

	ArrayList<QnaVO> getQnaList();

	QnaVO getQnaInfo(QnaVO vo);

	String getQnaHashsalt(QnaVO vo);

	int deleteQna(QnaVO vo);
	
	int checkPw(QnaVO vo);
}
