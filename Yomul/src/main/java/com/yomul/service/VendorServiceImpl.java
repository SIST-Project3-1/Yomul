package com.yomul.service;

import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.VendorDAO;
import com.yomul.vo.VendorVO;

@Service("VendorService")
public class VendorServiceImpl implements VendorService {
	@Autowired
	private VendorDAO vendorDAO;
	
	// 업체 등록
	public String vendorSignUp(VendorVO vo) {
		return vendorDAO.vendorSingUp(vo);
	}

	// 업체 단골 수 확인
	public int getVendorCustomerCount(String no) {
		return vendorDAO.getVendorCustomerCount(no);
	}
	
	// 업체 단골 등록
	public int addVendorCustomer(String vno, String cno) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("vno", vno);
		params.put("cno", cno);
		
		return vendorDAO.addVendorCustomer(params);
	}
	
	// 업체 단골 해제
	public int removeVendorCustomer(String vno, String cno) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("vno", vno);
		params.put("cno", cno);
		
		return vendorDAO.removeVendorCustomer(params);
	}
}
