package com.yomul.dao;

import com.yomul.vo.NearVO;

public class NearDAO extends DAO{

	public int getNearWrite(NearVO vo) {
		int result = -2;
		
		try {
			String sql = "INSERT INTO NEARS(NO,TITLE,CATEGORY,PRICE,HP,CONTENT,NDATE,CHATCHECK) VALUES(NEAR_NO_SEQ.NEXTVAL,?,?,?,?,?,SYSDATE,?) ";
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getCategory());
			pstmt.setInt(3, vo.getPrice());
			pstmt.setString(4, vo.getHp());
			pstmt.setString(5, vo.getContent());
			pstmt.setInt(6, vo.getChatCheck());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int getNearFile(NearVO vo) {
		int result = -2;
		
		try {
			String sql = "INSERT INTO NEARS(NO,TITLE,CATEGORY,PRICE,HP,CONTENT,NDATE,CHATCHECK) VALUES(NEAR_NO_SEQ.NEXTVAL,?,?,?,?,?,SYSDATE,?) ";
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getCategory());
			pstmt.setInt(3, vo.getPrice());
			pstmt.setString(4, vo.getHp());
			pstmt.setString(5, vo.getContent());
			pstmt.setInt(6, vo.getChatCheck());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
}
