package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ProductVO;

@Repository
public class MemberDAO extends DAO {

	private static String namespace = "mapper.member";

	/**
	 * 비밀번호 초기화
	 * 
	 * @param vo
	 * @return
	 */
	public int resetPW(MemberVO vo) {
		return sqlSession.update(namespace + ".resetPW", vo);
	}

	/**
	 * 닉네임으로 회원 번호 구하기
	 * 
	 * @param nickname
	 * @return
	 */
	public String getNo(String nickname) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nickname", nickname);
		return sqlSession.selectOne(namespace + ".getNo", params);
	}

	/**
	 * 구매 내역 가져오기
	 * 
	 * @param member
	 * @param page
	 * @return
	 */
	public ArrayList<ProductVO> getBuyList(MemberVO member, String page) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member", member);
		params.put("page", page);
		List<ProductVO> list = sqlSession.selectList(namespace + ".getBuyList", params);
		return (ArrayList<ProductVO>) list;
	}

	/**
	 * 판매 내역 가져오기
	 * 
	 * @param member
	 * @param page
	 * @return
	 */
	public ArrayList<ProductVO> getSellList(MemberVO member, String page) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member", member);
		params.put("page", page);
		List<ProductVO> list = sqlSession.selectList(namespace + ".getSellList", params);
		return (ArrayList<ProductVO>) list;
	}

	/**
	 * 판매완료 수 가져오기
	 * 
	 * @param no
	 * @return
	 */
	public int getSoldCount(String no) {
		return sqlSession.selectOne(namespace + ".getSoldCount", no);
	}

	/**
	 * 판매 중 수 가져오기
	 * 
	 * @param no
	 * @return
	 */
	public int getSellingcount(String no) {
		return sqlSession.selectOne(namespace + ".getSellingcount", no);
	}

	/**
	 * 찜 목록 가져오기
	 * 
	 * @param member
	 * @param page
	 * @return
	 */
	public ArrayList<ProductVO> getMyFavoriteList(MemberVO member, String page) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member", member);
		params.put("page", page);
		List<ProductVO> list = sqlSession.selectList(namespace + ".getMyFavoriteList", params);
		return (ArrayList<ProductVO>) list;
	}

	/**
	 * 비밀번호 일치 확인
	 * 
	 * @param vo
	 * @return
	 */
	public int checkPW(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".checkPW", vo);
	}

	/**
	 * 회원 탈퇴 처리
	 * 
	 * @param vo
	 * @return
	 */
	public int withdrawal(MemberVO vo) {
		return sqlSession.update(namespace + ".withdrawal", vo);
	}

	/**
	 * 회원 탈퇴 취소
	 * 
	 * @param vo
	 * @return
	 */
	public int cancleWithdrawal(MemberVO vo) {
		return sqlSession.update(namespace + ".cancleWithdrawal", vo);
	}

	/**
	 * 카카오톡 연동하기
	 * 
	 * @param vo
	 * @return
	 */
	public int kakaoRegister(MemberVO vo) {
		return sqlSession.update(namespace + ".kakaoRegister", vo);
	}

	/**
	 * 회원 삭제
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteMember(MemberVO vo) {
		return sqlSession.delete(namespace + ".deletemember", vo);
	}

	/**
	 * 회원 목록 가져오기
	 * 
	 * @return
	 */
	public ArrayList<MemberVO> getMemberList(int page, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("search", search);
		List<MemberVO> list = sqlSession.selectList(namespace + ".getmemberlist", map);
		return (ArrayList<MemberVO>) list;
	}

	/**
	 * 총 페이지 수 가져오기
	 * 
	 * @return
	 */
	public int getTotalPageCount(String search) {
		return sqlSession.selectOne(namespace + ".gettotalpagecount", search);
	}

	/**
	 * 프로필 정보 가져오기
	 * 
	 * @param vo
	 * @return
	 */
	public MemberVO getMyProfileInfo(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".getmyprofileinfo", vo);
	}

	/**
	 * 프로필 사진 가져오기
	 * 
	 * @param vo
	 * @return
	 */
	public FileVO getMyProfileImg(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".getmyprofileimg", vo);
	}

	/**
	 * 프로필 정보 업데이트
	 * 
	 * @param vo
	 * @return
	 */
	public int setMyProfileInfo(MemberVO vo) {
		return sqlSession.insert(namespace + ".setmyprofileinfo", vo);
	}

	/**
	 * 물품 구매 내역 수 조회하기
	 * 
	 * @param vo
	 * @return
	 */
	public int getBuyCount(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".getbuycount", vo);
	}

	/**
	 * 물품 판매 내역 수 조회하기
	 * 
	 * @param vo
	 * @return
	 */
	public int getSellCount(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".getsellcount", vo);
	}

	/**
	 * 물품 찜 개수 조회하기
	 * 
	 * @param vo
	 * @return
	 */
	public int getFavoriteCount(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".getfavoritecount", vo);
	}

	// 회원 가입
	public int join(MemberVO vo) {
		return sqlSession.insert(namespace + ".join", vo);
	}

	// 이메일 중복 확인
	public int emailCheck(String email) {
		return sqlSession.selectOne(namespace + ".emailcheck", email);
	}

	// 닉네임 중복 확인
	public int nicknameCheck(String nickname) {
		return sqlSession.selectOne(namespace + ".nicknamecheck", nickname);
	}

	/**
	 * 로그인 처리
	 * 
	 * @param vo
	 * @return
	 */
	public MemberVO getLoginResult(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".getLoginResult", vo);
	}

	/**
	 * HashSalt 가져오기
	 * 
	 * @param vo
	 * @return
	 */
	public String getHashsalt(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".getHashsalt", vo);
	}
}
