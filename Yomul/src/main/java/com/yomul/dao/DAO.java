package com.yomul.dao;

import java.sql.*;
import java.util.ArrayList;

//반환형이 int인 경우 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2
abstract public class DAO {
	String url;
	String user = "scott";
	String pass = "tiger";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	// Constructor
	public DAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 운영체제 확인
			String osName = System.getProperty("os.name").toLowerCase();
			if (osName.indexOf("win") >= 0) { // 윈도우
				url = "jdbc:oracle:thin:@127.0.0.1:1521";
			} else if (osName.indexOf("mac") >= 0) { // 맥북
				url = "jdbc:oracle:thin:@localhost:1521/xe";
			}

			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** PreparedStatement 생성 **/
	public void getPreparedStatement(String sql) {
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 종료 **/
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 게시글 파일 불러오기
	public ArrayList<String> getFiles(String board, int no) {
		ArrayList<String> list = new ArrayList<String>();
		String articleNo = board + no;
		
		try {
			String sql = " select filename "
					+ " from yomul_files "
					+ " where article_no = ? "
					+ " order by no asc ";
			getPreparedStatement(sql);
			
			pstmt.setString(1, articleNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
