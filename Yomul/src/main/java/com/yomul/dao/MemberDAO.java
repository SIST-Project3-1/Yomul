package com.yomul.dao;

import com.yomul.vo.MemberVO;

//반환형이 int인 경우 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2
public class MemberDAO extends DAO {

	// 회원 가입
	public int join(MemberVO vo) {
		int result = -2;
		try {
			String sql = "INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getNickname());
			pstmt.setString(4, vo.getHashsalt());
			pstmt.setString(5, vo.getSubscribe());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 이메일 중복 확인
	public int emailCheck(String email) {
		int result = -2;
		try {
			String sql = "SELECT COUNT(EMAIL) FROM YOMUL_MEMBERS WHERE LOWER(EMAIL) = LOWER(?)";
			getPreparedStatement(sql);

			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 닉네임 중복 확인
	public int nicknameCheck(String nickname) {
		int result = -2;
		try {
			String sql = "SELECT COUNT(NICKNAME) FROM YOMUL_MEMBERS WHERE LOWER(NICKNAME) = LOWER(?)";
			getPreparedStatement(sql);

			pstmt.setString(1, nickname);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
