package com.yomul.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.NoticeVO;

@Repository
public class CustomerCenterDAO extends DAO {
	private static String nameSpace = "mapper.customerCenter";

	@Autowired
	private SqlSessionTemplate sqlSession;


	public ArrayList<CategoryVO> getQnaCategories() {
		List<CategoryVO> list = sqlSession.selectList(nameSpace + ".getqnacategories");
		return (ArrayList<CategoryVO>) list;
	}

	// faq 카테고리 목록 구하기
	public ArrayList<CategoryVO> getFaqCategories() {
		List<CategoryVO> list = sqlSession.selectList(nameSpace + ".selectFaqCategories");
		return (ArrayList<CategoryVO>) list;
	}

	// faq 목록 반환
	public ArrayList<FaqVO> getFaqList() {
		List<FaqVO> list = sqlSession.selectList(nameSpace + ".selectFaqList");
		return (ArrayList<FaqVO>) list;
	}

	// 사용자 공지사항 목록 조회
	public ArrayList<NoticeVO> getNoticeList() {
		List<NoticeVO> list = sqlSession.selectList(nameSpace + ".selectNoticeList");
		return (ArrayList<NoticeVO>) list;
	}

	// 사용자 공지사항 상세 조회
	public NoticeVO getNoticeInfo(String no) {
		return sqlSession.selectOne(nameSpace + ".selectNoticeInfo", no);
	}

	// 공지사항 조회수 추가
	public int addNoticeHits(String no) {
		return sqlSession.update(nameSpace + ".updateNoticeHits", no);
	}
}
