package com.yomul.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.TownDAO;
import com.yomul.vo.FileVO;
import com.yomul.vo.TownVO;

@Service("townService")
public class TownServiceImpl implements TownService{

	@Autowired
	private TownDAO townDAO;

	@Override
	public boolean getTownWrite(TownVO town, FileVO file) {
		return townDAO.getTownWrite(town, file) == 2 ? true : false;
	}
	
	
	
	
}
