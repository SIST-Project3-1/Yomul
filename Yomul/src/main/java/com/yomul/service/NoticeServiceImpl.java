package com.yomul.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.NoticeDAO;
import com.yomul.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public int writeNotice(NoticeVO vo) {
		return noticeDAO.writeNotice(vo) == 1 ? 1 : 0;
	}
	@Override
	public int updateNotice(NoticeVO vo, int no) {
		return noticeDAO.updateNotice(vo, no) == 1 ? 1 : 0;
	}
	@Override
	public int deleteNotice(NoticeVO vo) {
		return noticeDAO.deleteNotice(vo) == 1 ? 1 : 0;
	}
	@Override
	public ArrayList<NoticeVO> getNoticeList(String page) {
		return noticeDAO.getNoticeList(page);
	}
	@Override
	public int getTotalPageCount() {
		return noticeDAO.getTotalPageCount();
	}
	@Override
	public NoticeVO getNoticeInfo(int no) {
		return noticeDAO.getNoticeInfo("N" + no);
	}
}
