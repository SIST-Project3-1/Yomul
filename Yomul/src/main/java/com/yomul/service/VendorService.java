package com.yomul.service;

import com.yomul.vo.VendorVO;

public interface VendorService {
	
	// 업체 등록, 저장에 성공한 경우 업체 번호 반환, 실패한 경우 "0" 반환
	public String vendorSignUp(VendorVO vo);
	
	// 업체 단골 수 확인
	public int getVendorCustomerCount(String no);
	
	// 업체 단골 등록
	public int addVendorCustomer(String vno, String cno);
	
	// 업체 단골 해제
	public int removeVendorCustomer(String vno, String cno);
	
	// 업체 단골 등록/해제
	public int switchVendorCustomer(String vno, String cno);
	
	// 업체 번호로 업체 조회
	public VendorVO getVendorInfo(String no);
}
