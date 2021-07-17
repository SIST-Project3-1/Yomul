package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.FileVO;

public interface FileService {
	int uploadFile(FileVO vo);

	public ArrayList<String> getNoticeFiles(int no);
	
	public ArrayList<String> getArticleFiles(String no);

	ArrayList<FileVO> getFileList(String no);
	
	public int deleteArticleFiles(String articleNo);
}
