package com.mycgv.dao;

import java.util.ArrayList;

import com.mycgv.vo.BoardVO;

public class BoardDAO extends DBConn {

	/* 전체 카운트 가져오기 */
	// execTotalCount()
	public int execTotalCount() {
		int count = 0;
		String sql = " select count(*) from mycgv_board";
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

	// Delete 진행 시 upload된 파일 삭제를 위해 파일명 가져오기
	public String getBsfile(String bid) {
		String result = null;
		try {
			String sql = "SELECT BSFILE FROM MYCGV_BOARD WHERE BID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, bid);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// Delete ---> 게시글 삭제
	public boolean getDeleteResult(String bid) {
		boolean result = false;
		try {
			String sql = "DELETE FROM MYCGV_BOARD WHERE BID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, bid);

			int val = pstmt.executeUpdate();
			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// Update ---> 게시글 수정
	public boolean getUpdateResultNofile(BoardVO vo) {
		boolean result = false;
		try {
			String sql = "UPDATE MYCGV_BOARD  SET BTITLE = ?, BCONTENT = ? WHERE BID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setString(3, vo.getBid());

			int val = pstmt.executeUpdate();
			System.out.println(val);
			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// Update ---> 게시글 수정
	public boolean getUpdateResult(BoardVO vo) {
		boolean result = false;
		try {
			String sql = "UPDATE MYCGV_BOARD  SET BTITLE = ?, BCONTENT = ?, BFILE = ?, BSFILE = ? WHERE BID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setString(3, vo.getBfile());
			pstmt.setString(4, vo.getBsfile());
			pstmt.setString(5, vo.getBid());

			int val = pstmt.executeUpdate();
			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// Update ---> 조회수 업데이트
	public boolean getUpdateHit(String bid) {
		boolean result = false;
		try {
			String sql = "UPDATE MYCGV_BOARD SET BHIT = BHIT + 1 WHERE BID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, bid);
			int val = pstmt.executeUpdate();
			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// Select ---> 상세 정보
	public BoardVO getContent(String bid) {
		BoardVO vo = new BoardVO();

		try {
			String sql = "SELECT BID, BTITLE, BCONTENT, BHIT, TO_CHAR(BDATE, 'YYYY-MM-DD'), BFILE, BSFILE AS BDATE FROM MYCGV_BOARD WHERE BID = ? ORDER BY BDATE";
			getPreparedStatement(sql);

			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setBid(rs.getString(1));
				vo.setBtitle(rs.getString(2));
				vo.setBcontent(rs.getString(3));
				vo.setBhit(rs.getInt(4));
				vo.setBdate(rs.getString(5));
				vo.setBfile(rs.getString(6));
				vo.setBsfile(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	// Select ---> 전체 리스트
	public ArrayList<BoardVO> getList() {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();

		try {
			String sql = "SELECT ROWNUM AS RNO, BID, BTITLE, BHIT, TO_CHAR(BDATE, 'YYYY-MM-DD') FROM (SELECT * FROM MYCGV_BOARD ORDER BY BDATE DESC)";
			getPreparedStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setRno(rs.getInt(1));
				vo.setBid(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBhit(rs.getInt(4));
				vo.setBdate(rs.getString(5));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}

	// Select --> 전체 리스트 : 페이징 처리
	public ArrayList<BoardVO> getList(int start, int end) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = "select rno, bid, btitle, bhit, bdate ";
		sql += " from (select rownum rno, bid, btitle, bhit, to_char(bdate, 'yyyy-mm-dd') bdate ";
		sql += " from (select bid, btitle, bhit, bdate from mycgv_board ";
		sql += " order by bdate desc)) ";
		sql += " where rno between ? and ?";

		getPreparedStatement(sql);

		try {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setRno(rs.getInt(1));
				vo.setBid(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBhit(rs.getInt(4));
				vo.setBdate(rs.getString(5));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();

		return list;
	}

	// insert ---> 게시판 글쓰기
	public boolean getInsertResult(BoardVO vo) {
		boolean result = false;

		try {
			String sql = "INSERT INTO MYCGV_BOARD VALUES('b_'||SEQ_MYCGV_BOARD.NEXTVAL, ?, ?, ?, ?, 0, SYSDATE)";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setString(3, vo.getBfile());
			pstmt.setString(4, vo.getBsfile());

			int val = pstmt.executeUpdate();

			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}
}
