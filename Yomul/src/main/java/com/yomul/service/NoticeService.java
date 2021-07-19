package com.yomul.service;

import com.yomul.vo.NoticeVO;

public interface NoticeService {

	int writeNotice(NoticeVO vo);
	int updateNotice(NoticeVO vo);
	int deleteNotice(NoticeVO vo);
}
