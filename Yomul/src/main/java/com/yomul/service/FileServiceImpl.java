package com.yomul.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.yomul.dao.FileDAO;
import com.yomul.vo.FileVO;

public class FileServiceImpl implements FileService {

	@Autowired
	private FileDAO fileDAO;

	@Override
	public int uploadFile(FileVO vo) {
		return fileDAO.uploadFile(vo) == 1 ? 1 : 0;
	}

	@Override
	public int getNextFileNo() {
		return fileDAO.getNextFileNo();
	}

}
