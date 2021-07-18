package com.yomul.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.FileDAO;
import com.yomul.vo.FileVO;

@Service("fileService")
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDAO fileDAO;

	@Override
	public int uploadFile(FileVO vo) {
		return fileDAO.uploadFile(vo) == 1 ? 1 : 0;
	}

	@Override
	public ArrayList<String> getNoticeFiles(int no) {
		return fileDAO.getArticleFiles("N" + no);
	}

	@Override
	public ArrayList<String> getArticleFiles(String no) {
		return fileDAO.getArticleFiles(no);
	}
	
	@Override
	public ArrayList<FileVO> getFileList(String no) {
		return fileDAO.getFileList(no);
	}
	
	// 게시글 파일 모두 삭제
	@Override
	public int deleteArticleFiles(String articleNo) {
		return fileDAO.deleteArticleFiles(articleNo);
	}
}
