package com.yomul.dao;

import com.yomul.vo.VendorVO;

public class VendorDAO extends DAO{

	private static String nameSpace = "mapper.vendor";
	
	public int vendorSingUp(VendorVO vo) {
		return sqlSession.insert(nameSpace + ".insertVendor", vo);
	}
}
