package com.yomul.service;

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
	public int updateNotice(NoticeVO vo) {
		return noticeDAO.updateNotice(vo) == 1 ? 1 : 0;
	}
	@Override
	public int deleteNotice(NoticeVO vo) {
		return noticeDAO.deleteNotice(vo) == 1 ? 1 : 0;
	}

}
