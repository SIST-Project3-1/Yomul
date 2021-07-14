package com.yomul.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;

//반환형이 int인 경우 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2
@Repository
public class MemberDAO extends DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String namespace = "mapper.member";

	/**
	 * 회원 삭제
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteMember(MemberVO vo) {
		System.out.println(vo.toStringJson());
		return sqlSession.delete(namespace + ".deletemember", vo);
	}

	/**
	 * 회원 목록 가져오기
	 * 
	 * @return
	 */
	public ArrayList<MemberVO> getMemberList() {
		List<MemberVO> list = sqlSession.selectList(namespace + ".getmemberlist");
		return (ArrayList<MemberVO>) list;
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

}
