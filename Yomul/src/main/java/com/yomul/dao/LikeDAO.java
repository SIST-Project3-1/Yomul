package com.yomul.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAO extends DAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String nameSpace = "mapper.like";
	
	// 좋아요 추가
	public int addLike(HashMap<String, String> params) {
		try {
			sqlSession.insert(nameSpace + ".insertLike", params);
		} catch (Exception e) { // 실패 시 0 반환
			return 0;
		}
		
		// 성공 시 해당 글의 현재 좋아요 수 반환
		return getLikeCount(params.get("ano"));
	}
	
	// 좋아요 수 확인
	public int getLikeCount(String ano) {
		try {
			return sqlSession.selectOne(nameSpace + ".selectLikeCount", ano);
		} catch (NullPointerException e) { // 해당 게시글의 좋아요가 하나도 없을 시 널포인터 예외 발생
			return 0;
		}
	}
}
