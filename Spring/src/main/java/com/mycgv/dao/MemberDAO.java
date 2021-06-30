package com.mycgv.dao;

import java.util.ArrayList;

import com.mycgv.vo.MemberVO;
import com.mycgv.vo.SessionVO;

public class MemberDAO extends DBConn {

	// id 중복 체크
	public int getIdResult(String id) {
		int result = -2;
		try {
			String sql = "SELECT COUNT(*) FROM MYCGV_MEMBER WHERE ID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 전체 카운트 가져오기 */
	// execTotalCount()
	public int execTotalCount() {
		int count = 0;
		String sql = " select count(*) from mycgv_member";
		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	// insert : c ---> 회원가입
	public boolean getInsertResult(String id, String pass, String name, String gender, String email, String hp, String hlist, String intro) {
		boolean result = false;
		String sql = "insert into mycgv_member values(?,?,?,?,?,?,?,?,sysdate,0)";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, email);
			pstmt.setString(6, hp);
			pstmt.setString(7, hlist);
			pstmt.setString(8, intro);

			int value = pstmt.executeUpdate();

			if (value != 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		close();

		return result;
	}

	public boolean getInsertResult(MemberVO vo) {
		boolean result = false;
		String sql = "insert into mycgv_member values(?,?,?,?,?,?,?,?,sysdate,0)";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getHp());
			pstmt.setString(7, vo.getHlist());
			pstmt.setString(8, vo.getIntro());

			int value = pstmt.executeUpdate();

			if (value != 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		close();

		return result;
	}

	// select : r
	// 로그인 처리 -- count 함수를 사용
	public boolean getLoginResult(String id, String pw) {
		boolean result = false;

		try {
			String sql = "SELECT COUNT(*) FROM MYCGV_MEMBER WHERE ID=? AND PW=?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int value = rs.getInt(1);
				if (value == 1) {
					result = true;
				} else {
					result = false;
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 로그인 처리 -- count 함수를 사용
	public SessionVO getLoginResult(MemberVO vo) {
		SessionVO svo = new SessionVO();

		try {
			String sql = "SELECT COUNT(*) AS LOGIN_RESULT, NAME FROM MYCGV_MEMBER WHERE ID=? AND PW=? GROUP BY NAME";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				svo.setResult(rs.getInt(1));
				svo.setName(rs.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return svo;
	}

	// 회원 전체 리스트
	public ArrayList<MemberVO> getList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			String sql = "SELECT ROWNUM AS RNO, ID, NAME, HP, GENDER, TO_CHAR(MDATE, 'YYYY-MM-DD') AS MDATE, CHOICE " + "FROM (SELECT ID, NAME, HP, GENDER, MDATE, CHOICE FROM MYCGV_MEMBER " + "          ORDER BY MDATE DESC)";
			getPreparedStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setRno(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setHp(rs.getString(4));
				vo.setGender(rs.getString(5));
				vo.setMdate(rs.getString(6));
				vo.setChoice(rs.getInt(7));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Select --> 전체 리스트 : 페이징 처리
	public ArrayList<MemberVO> getList(int start, int end) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = "select rno, id, name, hp, gender, mdate, choice ";
		sql += "from (select rownum rno, id, name, hp, gender, to_char(mdate, 'yyyy-mm-dd') mdate , choice ";
		sql += "        from (select id, name, hp, gender, mdate, choice ";
		sql += "                from mycgv_member ";
		sql += "                order by mdate desc))  ";
		sql += "where rno between ? and ?";

		getPreparedStatement(sql);

		try {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setRno(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setHp(rs.getString(4));
				vo.setGender(rs.getString(5));
				vo.setMdate(rs.getString(6));
				vo.setChoice(rs.getInt(7));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();

		return list;
	}

	// 회원 상세 정보
	public MemberVO getContent(String id) {
		MemberVO vo = null;
		try {
			String sql = "SELECT ID, NAME, HP, GENDER, EMAIL, TO_CHAR(MDATE, 'YYYY-MM-DD') AS MDATE, HLIST, INTRO FROM MYCGV_MEMBER WHERE ID=?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setGender(rs.getString(4));
				vo.setEmail(rs.getString(5));
				vo.setMdate(rs.getString(6));
				vo.setHlist(rs.getString(7));
				vo.setIntro(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	// update : u

	// delete : d

}
