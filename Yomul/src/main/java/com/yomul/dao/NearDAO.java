package com.yomul.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.NearVO;

@Repository
public class NearDAO extends DAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String nameSpace = "mapper.near";
	
	public int getNearWrite(NearVO vo) {
		int result = -2;
		
		try {
			String sql = "INSERT INTO YOMUL_NEAR_ARTICLES(NO,WRITER,TITLE,CATEGORY,PRICE,HP,CONTENT,NDATE,CHATCHECK,HITS) VALUES('N'||YOMUL_NEAR_ARTICLES_NO_SEQ.NEXTVAL,'M1',?,?,?,?,?,SYSDATE,?,0) ";
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
	
	public int getNearFile(String saveFileName, String originFilename) {
		int result = -2;
		
		try {
			String sql = "INSERT INTO YOMUL_FILES(ARTICLE_NO,NO,FILENAME) VALUES(?,YOMUL_NEAR_ARTICLES_NO_SEQ.NEXTVAL,?) ";
			getPreparedStatement(sql);
			
			
			pstmt.setString(1, saveFileName);
			pstmt.setString(2, originFilename);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//내 근처 글쓰기 글번호 가져오기
	public String getWriteNumber() {
		String result = "";
		
		try {
			String sql = "SELECT MAX(NO) FROM YOMUL_NEAR_ARTICLES";
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	//내 근처 홈 글 보기
	public List<NearVO> getList(NearVO vo){
		return sqlSession.selectList(nameSpace + ".selectNearList");
	}
	
	
	
	// 내 근처 게시글 상세 보기
	public NearVO getNearInfo(String no) {
		return sqlSession.selectOne(nameSpace + ".selectNearInfo", no);
	}
	
	// 내 근처 게시글 조회수 업데이트
	public int updateNearHits(String no) {
		return sqlSession.update(nameSpace + ".updateNearHits", no);
	}
 
}
