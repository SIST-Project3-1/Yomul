package com.yomul.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;

@Repository
public class FaqDAO extends DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String nameSpace = "mapper.faq";
	
	// 관리자 FAQ 글쓰기 데이터 저장
	public int getAdminFaqWrite(FaqVO faq) {
		return sqlSession.insert(nameSpace + ".getAdminFaqWrite", faq);
	}
	
	// 관리자 FAQ 목록 가져오기
	public ArrayList<FaqVO> getAdminFaqList(int page, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("search", search);
		List<FaqVO> list = sqlSession.selectList(nameSpace + ".getAdminFaqList", map);
		return (ArrayList<FaqVO>) list;
	}
	
	// 관리자 FAQ 전체 페이지 수 구하기
	public int getTotalPageFaq(String search) {
		return sqlSession.selectOne(nameSpace + ".getTotalPageFaq", search);
	}
	
	// 관리자 FAQ 글수정 카테고리 목록 구하기
	public ArrayList<CategoryVO> updateFaqCategories(int categoryNo) {
		List<CategoryVO> list = sqlSession.selectList(nameSpace + ".updateFaqCategories", categoryNo);
		return (ArrayList<CategoryVO>) list;
	}
	
	// 관리자 FAQ 글수정 데이터 불러오기
	public FaqVO getAdminFaqUpdateData(String no) {
		return sqlSession.selectOne(nameSpace + ".getAdminFaqUpdateData", no);
	}
		
	// 관리자 FAQ 글수정 데이터 저장
	public int getAdminFaqUpdate(FaqVO faq) {
		return sqlSession.update(nameSpace + ".getAdminFaqUpdate", faq);
	}
	
}
