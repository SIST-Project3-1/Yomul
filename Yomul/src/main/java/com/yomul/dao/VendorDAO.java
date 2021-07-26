package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;
import com.yomul.vo.ReviewVO;
import com.yomul.vo.VendorVO;

@Repository
public class VendorDAO extends DAO {

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

	// 업체 탈퇴 신청
	public int withdrawalVendor(String owner) {
		return sqlSession.update(nameSpace + ".withdrawalVendor", owner);
	}

	// 업체 탈퇴 신청
	public int cancelWithdrawalVendor(String owner) {
		return sqlSession.update(nameSpace + ".cancelWithdrawalVendor", owner);
	}

	// 업체 정보 수정
	public int updateVendorInfo(VendorVO vo) {
		return sqlSession.update(nameSpace + ".updateVendor", vo);
	}

	// 업체 단골 목록 조회
	public ArrayList<MemberVO> getVendorCustomers(HashMap<String, Object> params) {
		List<MemberVO> list = sqlSession.selectList(nameSpace + ".selectVendorCustomerList", params);
		return (ArrayList<MemberVO>) list;
	}

	// 업체 단골 수 확인
	public int getVendorCustomerCount(String no) {
		try {
			return sqlSession.selectOne(nameSpace + ".selectVendorCustomerCount", no);
		} catch (NullPointerException e) { // 0명일 시 널 포인터 예외 발생
			return 0;
		}
	}

	/**
	 * 업체 소식 목록 가져오기
	 * 
	 * @param params
	 * @return
	 */
	public ArrayList<NearVO> getVendorNewsList(HashMap<String, Object> params) {
		List<NearVO> list = sqlSession.selectList(nameSpace + ".selectVendorNewsList", params);
		return (ArrayList<NearVO>) list;
	}

	// 업체 후기 목록 조회
	public ArrayList<ReviewVO> getVendorReviewList(HashMap<String, Object> params) {
		List<ReviewVO> list = sqlSession.selectList(nameSpace + ".selectVendorReviewList", params);
		return (ArrayList<ReviewVO>) list;
	}

	// 업체 후기 상세 보기
	public ReviewVO getVendorReviewInfo(String no) {
		try {
			return sqlSession.selectOne(nameSpace + ".selectVendorReviewInfo", no);
		} catch (NullPointerException e) {
			return null;
		}
	}

	// 업체 후기 조회수 업데이트
	public int updateVendorReviewHits(String no) {
		return sqlSession.update(nameSpace + ".updateVendorReviewHits", no);
	}

	// 업체 정보 조회
	public VendorVO getVendorInfo(String no) {
		try {
			if (no.startsWith("V")) { // 업체 번호일 경우 업체 번호로 조회
				return sqlSession.selectOne(nameSpace + ".selectVendorByNo", no);
			} else if (no.startsWith("M")) { // 회원 번호일 경우 회원 번호로 조회
				return sqlSession.selectOne(nameSpace + ".selectVendorByOwner", no);
			} else {
				return null;
			}
		} catch (NullPointerException e) { // 해당 업체가 없을 경우 null 반환
			return null;
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

	// 업체 단골 등록/해제
	public int switchVendorCustomer(HashMap<String, String> params) {
		try { // 단골 등록이 되면 업체의 단골 수 반환
			sqlSession.insert(nameSpace + ".insertVendorCustomer", params);
			return getVendorCustomerCount(params.get("ano"));
		} catch (Exception e) { // 등록에 실패하면(이미 등록되어 있으면) 등록 취소하고 0 반환
			sqlSession.delete(nameSpace + ".deleteVendorCustomer", params);
			return 0;
		}
	}

	// 업체 번호로 업체 주인 사용자 번호 구하기
	public String getVendorOwner(String no) {
		try {
			return sqlSession.selectOne(nameSpace + ".selectOwnerNoByVendorNo", no);
		} catch (NullPointerException e) {
			return "";
		}
	}

	// 사용자 번호로 업체 여부 확인
	public String getVendorNoByOwner(String no) {
		try {
			return sqlSession.selectOne(nameSpace + ".selectVendorNoByOwner", no);
		} catch (NullPointerException e) {
			return "";
		}
	}

	/*
	 * 관리자 업체관리
	 */
	// 총 페이지 수 가져오기
	public int getTotalPageCount(String search) {
		return sqlSession.selectOne(nameSpace + ".gettotalpagecount", search);
	}

	// 업체 목록 가져오기
	public ArrayList<VendorVO> getVendorList(int page, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("search", search);
		List<VendorVO> list = sqlSession.selectList(nameSpace + ".getVendorList", map);
		return (ArrayList<VendorVO>) list;
	}

	// 업체 삭제
	public int deleteVendor(VendorVO vo) {
		return sqlSession.delete(nameSpace + ".deleteVendor", vo);
	}
}
