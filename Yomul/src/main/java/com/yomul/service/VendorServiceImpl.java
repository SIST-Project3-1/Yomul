package com.yomul.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.VendorDAO;
import com.yomul.vo.VendorVO;

@Service("VendorService")
public class VendorServiceImpl implements VendorService {
	@Autowired
	private VendorDAO VendorDAO;
	
	// 업체 등록
	public int vendorSignUp(VendorVO vo) {
		return VendorDAO.vendorSingUp(vo);
	}
	
}
