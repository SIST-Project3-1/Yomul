package com.yomul.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.NearDAO;
import com.yomul.vo.NearVO;

@Service("nearService")
public class NearServiceImplement implements NearService{

	@Autowired
	private NearDAO dao;
	
	@Override
	public int getNearWrite(NearVO vo) {
		
		return dao.getNearWrite(vo);
	}

	@Override
	public NearVO getNearInfo(int no) {
		return dao.getNearInfo("N" + no);
	}
	
	@Override
	public boolean updateNearHits(int no) {
		boolean result = false;
		if(dao.updateNearHits("N" + no) != 0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<NearVO> selectNearList(NearVO vo) {
		
		return dao.getList(vo);
	}
}
