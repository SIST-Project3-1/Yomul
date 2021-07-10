package com.yomul.dao;

import com.yomul.vo.MemberVO;

//반환형이 int인 경우 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2
public class MemberDAO extends DAO {

	// 이메일 중복 확인
	public int emailCheck(String email) {
		int result = -2;
		try {
			String sql = "SELECT COUNT(EMAIL) FROM YOMUL_MEMBERS WHERE LOWER(EMAIL) = LOWER('?')";
			getPreparedStatement(sql);

			pstmt.setString(1, email);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
