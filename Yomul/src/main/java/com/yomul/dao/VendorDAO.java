package com.yomul.dao;

import java.util.HashMap;

import com.yomul.vo.VendorVO;

public class VendorDAO extends DAO{

	private static String nameSpace = "mapper.vendor";
	
	// 업체 등록
	public int vendorSingUp(VendorVO vo) {
		return sqlSession.insert(nameSpace + ".insertVendor", vo);
	}
	
	// 업체 단골 수 확인
	public int getVendorCustomerCount(String no) {
		return sqlSession.selectOne(nameSpace + ".selectVendorCustomerCount", no);
	}
	
	// 업체 단골 등록
	public int addVendorCustomer(HashMap<String, String> params) {
		return sqlSession.insert(nameSpace + ".insertVendorCustomer", params);
	}
	
	// 업체 단골 해제
	public int removeVendorCustomer(HashMap<String, String> params) {
		return sqlSession.delete(nameSpace + ".deleteVendorCustomer", params);
	}
}
