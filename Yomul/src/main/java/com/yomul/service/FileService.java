package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.FileVO;

public interface FileService {
	int uploadFile(FileVO vo);

	public ArrayList<String> getNoticeFiles(int no);
}
