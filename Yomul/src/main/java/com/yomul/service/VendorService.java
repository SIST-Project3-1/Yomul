package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;
import com.yomul.vo.ReviewVO;
import com.yomul.vo.VendorVO;

public interface VendorService {
	
	// 업체 등록, 저장에 성공한 경우 업체 번호 반환, 실패한 경우 "0" 반환
	public String vendorSignUp(VendorVO vo);
	
	// 업체 탈퇴 신청
	public int withdrawalVendor(String owner);
	
	// 업체 탈퇴 신청 취소
	public int cancelWithdrawalVendor(String owner);
	
	// 업체 정보 수정
	public int updateVendorInfo(VendorVO vo);
	
	// 업체 단골 목록 조회
	public ArrayList<MemberVO> getVendorCustomerList(String no, int page);
	
	// 업체 단골 수 확인
	public int getVendorCustomerCount(String no);
	
	// 업체 소식 목록 조회
	public ArrayList<NearVO> getVendorNewsList(String no, int page);
	
	// 업체 후기 목록 조회
	public ArrayList<ReviewVO> getVendorReviewList(String no, int page);
	
	// 업체 후기 상세 보기
	public ReviewVO getVendorReviewInfo(String no);
	
	// 업체 후기 조회수 업데이트
	public int updateVendorReviewHits(String no);
	
	// 업체 단골 등록
	public int addVendorCustomer(String vno, String cno);
	
	// 업체 단골 해제
	public int removeVendorCustomer(String vno, String cno);
	
	// 업체 단골 등록/해제
	public int switchVendorCustomer(String vno, String cno);
	
	// 업체 번호로 업체 조회
	public VendorVO getVendorInfo(String no);
	
	// 업체 번호로 주인 사용자 번호 조회
	public String getVendorOwner(String no);
	
	// 사용자 번호로 업체인지 확인
	public boolean isVendor(String no);
	
	// 사용자 번호로 업체 번호 조회
	public String getVendorNo(String no);
	
	/*
	 * 관리자 업체관리
	 */
	// 페이지 수 구하기
	int getTotalPageCount(String search);
	
	// 업체 목록 가져오기
	ArrayList<VendorVO> getVendorList(int page, String search);
	
	// 업체 삭제
	int deleteVendor(VendorVO vo);
}
