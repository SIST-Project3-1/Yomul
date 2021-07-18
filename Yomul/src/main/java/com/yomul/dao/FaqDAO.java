package com.yomul.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.FaqVO;

@Repository
public class FaqDAO extends DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String nameSpace = "mapper.faq";
	
	//관리자 FAQ 글쓰기 데이터 저장
	public int getAdminFaqWrite(FaqVO faq) {
		return sqlSession.insert(nameSpace + ".getAdminFaqWrite", faq);
	}
	
}
