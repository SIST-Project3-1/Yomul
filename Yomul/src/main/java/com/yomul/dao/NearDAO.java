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
	
	//내 근처 홈 글 보기
	public List<NearVO> getList(){
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
 
	public int getNearFile(String saveFileName, String originFilename) {
		int result = -2;
		
		try {
			String sql = "INSERT INTO YOMUL_FILES(ARTICLE_NO,NO,FILENAME) VALUES(?,YOMUL_FILES_NO_SEQ.NEXTVAL,?) ";
			getPreparedStatement(sql);
			
			
			pstmt.setString(1, saveFileName);
			pstmt.setString(2, originFilename);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
