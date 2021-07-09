package com.yomul.service;

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

	
}
