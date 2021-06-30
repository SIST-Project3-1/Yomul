package com.mycgv.dao;

import java.util.ArrayList;

import com.mycgv.vo.NoticeVO;
import com.mycgv.vo.NoticeVO;

public class NoticeDAO extends DBConn{

	/* 전체 카운트 가져오기 */
	// execTotalCount()
	public int execTotalCount() {
		int count = 0;
		String sql = " select count(*) from mycgv_notice";
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

	// 삭제할 게시글의 파일명 가져오기
	public String getNsfile(String nid) {
		String result = "";
		try {
			String sql = "SELECT NSFILE FROM MYCGV_NOTICE WHERE NID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, nid);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 파일이 변경되지 않는 경우
	public boolean getUpdateResultNofile(NoticeVO vo) {
		boolean result = false;
		try {
			String sql = "UPDATE MYCGV_NOTICE SET NTITLE = ?, NCONTENT = ? WHERE NID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNid());

			int val = pstmt.executeUpdate();
			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 새로운 파일을 선택한 경우
	public boolean getUpdateResult(NoticeVO vo) {
		boolean result = false;
		try {
			String sql = "UPDATE MYCGV_NOTICE SET NTITLE = ?, NCONTENT = ?, NFILE = ?, NSFILE = ? WHERE NID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNfile());
			pstmt.setString(4, vo.getNsfile());
			pstmt.setString(5, vo.getNid());

			int val = pstmt.executeUpdate();
			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean getDeleteResult(String nid) {
		boolean result = false;
		try {
			String sql = "DELETE FROM MYCGV_NOTICE WHERE NID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, nid);

			int val = pstmt.executeUpdate();
			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean getUpdateHit(String nid) {
		boolean result = false;
		try {
			String sql = "UPDATE MYCGV_NOTICE SET NHIT = NHIT + 1 WHERE NID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, nid);
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

	public NoticeVO getContent(String nid) {
		NoticeVO vo = null;
		try {
			String sql = "SELECT NID, NTITLE, NCONTENT, NFILE, NSFILE, NHIT, TO_CHAR(NDATE, 'YYYY-MM-DD') NDATE FROM MYCGV_NOTICE WHERE NID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, nid);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new NoticeVO();
				vo.setNid(rs.getString(1));
				vo.setNtitle(rs.getString(2));
				vo.setNcontent(rs.getString(3));
				vo.setNfile(rs.getString(4));
				vo.setNsfile(rs.getString(5));
				vo.setNhit(rs.getInt(6));
				vo.setNdate(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public ArrayList<NoticeVO> getList() {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		try {
			String sql = "SELECT ROWNUM AS RNO, NID, NTITLE, NHIT, TO_CHAR(NDATE, 'YYYY-MM-DD') AS NDATE ";
			sql += "	  FROM (SELECT NID, NTITLE, NHIT, NDATE FROM MYCGV_NOTICE ORDER BY NDATE DESC)";
			getPreparedStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNhit(rs.getInt(4));
				vo.setNdate(rs.getString(5));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}

	// Select --> 전체 리스트 : 페이징 처리
	public ArrayList<NoticeVO> getList(int start, int end) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		String sql = "select rno, nid, ntitle, nhit, ndate ";
		sql += "from (select rownum rno, nid, ntitle, nhit, to_char(ndate, 'yyyy-mm-dd') ndate ";
		sql += "        from (select nid, ntitle, nhit, ndate ";
		sql += "                from mycgv_notice ";
		sql += "                order by ndate desc)) ";
		sql += "where rno between ? and ?";

		getPreparedStatement(sql);

		try {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNhit(rs.getInt(4));
				vo.setNdate(rs.getString(5));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();

		return list;
	}

	public boolean getInsertResult(NoticeVO vo) {
		boolean result = false;
		try {
			String sql = "INSERT INTO MYCGV_NOTICE VALUES('n_' || SEQ_MYCGV_NOTICE.NEXTVAL, ?, ?, ?, ?, 0, SYSDATE)";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNfile());
			pstmt.setString(4, vo.getNsfile());

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
