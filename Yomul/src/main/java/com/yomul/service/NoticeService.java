package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.NoticeVO;

public interface NoticeService {

	int writeNotice(NoticeVO vo);
	int updateNotice(NoticeVO vo, int no);
	int deleteNotice(NoticeVO vo, int no);
	ArrayList<NoticeVO> getNoticeList(String page);
	int getTotalPageCount();
	NoticeVO getNoticeInfo(int no);
	// 공지사항 파일 등록
	int getNoticeFile(String saveFileName, String originFilename);
	String getNoticeNo();
}
