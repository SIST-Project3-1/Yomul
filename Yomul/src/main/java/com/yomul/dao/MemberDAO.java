package com.yomul.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.util.Security;
import com.yomul.vo.MemberVO;

//반환형이 int인 경우 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2
@Repository
public class MemberDAO extends DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String namespace = "mapper.member";

	/**
	 * 프로필 정보 가져오기
	 * 
	 * @param vo
	 * @return
	 */
	public MemberVO getMyProfileInfo(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".getmyprofileinfo", vo);
	}

	public int setMyProfileInfo(MemberVO vo) {
		int result = -2;
		try {
			// 정보 업데이트
			String sql = "UPDATE YOMUL_MEMBERS SET NICKNAME = ?, PHONE = ?, GENDER = ?, INTRO = ? WHERE NO = ? ";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getNickname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getIntro());
			pstmt.setString(5, vo.getNo());

			result = pstmt.executeUpdate();

			if (result == 1 && vo.getProfileImg() != null) { // 프로필 사진 변경
				sql = "MERGE INTO YOMUL_FILES USING DUAL ON (ARTICLE_NO = ?) ";
				sql += "  WHEN MATCHED THEN ";
				sql += "    UPDATE SET FILENAME = ? WHERE ARTICLE_NO = ? ";
				sql += "  WHEN NOT MATCHED THEN ";
				sql += "    INSERT (ARTICLE_NO, NO, FILENAME) VALUES(?, YOMUL_FILES_NO_SEQ.NEXTVAL, ?) ";
				getPreparedStatement(sql);

				pstmt.setString(1, vo.getNo());
				pstmt.setString(2, vo.getProfileImg());
				pstmt.setString(3, vo.getNo());
				pstmt.setString(4, vo.getNo());
				pstmt.setString(5, vo.getProfileImg());

				result = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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
