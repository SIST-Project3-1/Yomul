package com.yomul.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.NearDAO;
import com.yomul.vo.NearVO;

@Service("nearService")
public class NearServiceImplement implements NearService {

	@Autowired
	private NearDAO dao;

	@Override
	public int getNearWrite(NearVO vo) {

		return dao.getNearWrite(vo);
	}

	@Override
	public NearVO getNearInfo(String no) {
		return dao.getNearInfo(no);
	}

	@Override
	public int updateNearHits(String no) {
		return dao.updateNearHits(no);
	}

	@Override
	public List<NearVO> selectNearList(NearVO vo) {

		return dao.getList(vo);
	}

	@Override
	public int getNearFile(String saveFileName, String originFilename) {
		
		return dao.getNearFile(saveFileName, originFilename);
	}
}
