package com.yomul.dao;


import java.util.ArrayList;
import java.util.List;

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
	
	//관리자 FAQ 목록 가져로기
	public ArrayList<FaqVO> getAdminFaqList() {
		List<FaqVO> list = sqlSession.selectList(nameSpace + ".getAdminFaqList");
		return (ArrayList<FaqVO>) list;
	}
	
}
