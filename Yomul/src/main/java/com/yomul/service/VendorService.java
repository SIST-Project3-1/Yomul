package com.yomul.service;

import com.yomul.vo.VendorVO;

public interface VendorService {
	
	// 업체 등록
	public int vendorSignUp(VendorVO vo);
	
	// 업체 단골 수 확인
	public int getVendorCustomerCount(String no);
	
	// 업체 단골 등록
	public int addVendorCustomer(String vno, String cno);
	
	// 업체 단골 해제
	public int removeVendorCustomer(String vno, String cno);
}
