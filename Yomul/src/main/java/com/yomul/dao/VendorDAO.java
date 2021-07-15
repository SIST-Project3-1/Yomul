package com.yomul.dao;

import org.springframework.stereotype.Repository;

import com.yomul.vo.VendorVO;

@Repository
public class VendorDAO extends DAO{

	private static String nameSpace = "mapper.vendor";
	
	public int vendorSingUp(VendorVO vo) {
		return sqlSession.insert(nameSpace + ".insertVendor", vo);
	}
}
