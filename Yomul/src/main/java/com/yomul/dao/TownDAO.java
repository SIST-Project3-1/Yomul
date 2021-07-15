package com.yomul.dao;


import com.yomul.vo.FileVO;
import com.yomul.vo.TownVO;

public class TownDAO extends DAO{
	
	//동네생활 글 쓰기
	public boolean getTownWrite(TownVO vo, FileVO fvo) {
		boolean result = false;
		
		String sql = "INSERT ALL "
				+ " INTO YOMUL_TOWN_ARTICLES(NO,CATEGORY,TITLE,CONTENT,HITS,TDATE) VALUES('TA'||YOMUL_TOWN_ARTICLES_NO_SEQ.NEXTVAL,?,?,?,0,SYSDATE) "
				+ " INTO YOMUL_FILES(ARTICLE_NO,NO,FILENAME) VALUES('TA'||YOMUL_TOWN_ARTICLES_NO_SEQ.NEXTVAL,1,?) "
				+ " SELECT * FROM DUAL";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getCategory());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, fvo.getFilename());
			
			int value = pstmt.executeUpdate();
			if(value != 0){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	
	
}
