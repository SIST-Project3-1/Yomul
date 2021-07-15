package com.yomul.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO extends DAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String nameSpace = "mapper.report";
	
	// 신고 추가
	public int addReport(HashMap<String, String> params) {
		try {
			return sqlSession.insert(nameSpace + ".insertReport", params);
		} catch (Exception e) { // 실패 시 0 반환
			return 0;
		}
	}
}
