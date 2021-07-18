package com.yomul.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.VendorDAO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ReviewVO;
import com.yomul.vo.VendorVO;

@Service("VendorService")
public class VendorServiceImpl implements VendorService {
	@Autowired
	private VendorDAO vendorDAO;
	
	// 업체 등록
	@Override
	public String vendorSignUp(VendorVO vo) {
		return vendorDAO.vendorSingUp(vo);
	}

	// 업체 정보 수정
	@Override
	public int updateVendorInfo(VendorVO vo) {
		return vendorDAO.updateVendorInfo(vo);
	}
	
	// 업체 단골 목록 조회
	@Override
	public ArrayList<MemberVO> getVendorCustomerList(String no, int page) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("no", no);
		params.put("page", page);
		
		return vendorDAO.getVendorCustomers(params);
	}
	
	// 업체 단골 수 확인
	@Override
	public int getVendorCustomerCount(String no) {
		return vendorDAO.getVendorCustomerCount(no);
	}
	
	// 업체 후기 목록 조회
	@Override
	public ArrayList<ReviewVO> getVendorReviewList(String no, int page) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vno", no);
		params.put("page", page);
		
		return vendorDAO.getVendorReviewList(params);
	}
	
	// 업체 단골 등록
	@Override
	public int addVendorCustomer(String vno, String cno) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("vno", vno);
		params.put("cno", cno);
		
		return vendorDAO.addVendorCustomer(params);
	}
	
	// 업체 단골 해제
	@Override
	public int removeVendorCustomer(String vno, String cno) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("vno", vno);
		params.put("cno", cno);
		
		return vendorDAO.removeVendorCustomer(params);
	}
	
	// 업체 단골 등록/해제
	@Override
	public int switchVendorCustomer(String vno, String cno) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("vno", vno);
		params.put("cno", cno);
		
		return vendorDAO.switchVendorCustomer(params);
	}
	
	// 업체 번호로 업체 조회
	@Override
	public VendorVO getVendorInfo(String no) {
		return vendorDAO.getVendorInfo(no);
	}
}
