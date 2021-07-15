package com.yomul.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.yomul.vo.VendorVO;

@Repository
public class VendorDAO extends DAO{

	private static String nameSpace = "mapper.vendor";
	
	// 업체 등록
	public String vendorSingUp(VendorVO vo) {
		try {
			sqlSession.insert(nameSpace + ".insertVendor", vo);
		} catch (Exception e) { // 중복되는 값이 있을 시 예외 발생.
			return "0";
		}
			
		return sqlSession.selectOne(nameSpace + ".selectVendorNoByOwner", vo.getOwner());
	}
	
	// 업체 단골 수 확인
	public int getVendorCustomerCount(String no) {
		try {
			return sqlSession.selectOne(nameSpace + ".selectVendorCustomerCount", no);
		} catch (NullPointerException e) { // 0명일 시 널 포인터 예외 발생 
			return 0;
		}
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
