package com.yomul.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.NearDAO;
import com.yomul.vo.NearVO;

@Service("nearService")
public class NearServiceImplement implements NearService {

	@Autowired
	private NearDAO nearDAO;

	@Override
	public int getNearWrite(NearVO vo) {
		return nearDAO.getNearWrite(vo);
	}

	@Override
	public NearVO getNearInfo(String no) {
		return nearDAO.getNearInfo(no);
	}

	@Override
	public int updateNearHits(String no) {
		return nearDAO.updateNearHits(no);
	}

	@Override
	public List<NearVO> selectNearList(NearVO vo) {
		return nearDAO.getList(vo);
	}

	@Override
	public ArrayList<NearVO> getNearList(NearVO near, String page) {
		return nearDAO.getNearList(near, page);
	}
}
