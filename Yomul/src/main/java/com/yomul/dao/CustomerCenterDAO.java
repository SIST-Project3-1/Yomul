package com.yomul.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.NoticeVO;
import com.yomul.vo.QnaVO;

@Repository
public class CustomerCenterDAO extends DAO {
	private static String nameSpace = "mapper.customerCenter";

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * QnA 목록 가져오기
	 * 
	 * @return
	 */
	public ArrayList<QnaVO> getQnaList() {
		List<QnaVO> list = sqlSession.selectList(nameSpace + ".getqnalist");
		return (ArrayList<QnaVO>) list;
	}
	
	public QnaVO getQnaInfo(String no) {
		return sqlSession.selectOne(nameSpace+".getqnainfo", no);
	}

	/**
	 * 다음에 작성될 QnA 글 번호 가져오기
	 * 
	 * @return
	 */
	public String getNextQnaNo() {
		return sqlSession.selectOne(nameSpace + ".getnextqnano");
	}

	/**
	 * QnA 문의하기
	 * 
	 * @param vo
	 * @return
	 */
	public int writeQna(QnaVO vo) {
		System.out.println(vo.toStringDefault());
		System.out.println("file: " + vo.getFile().getOriginalFilename());
		return sqlSession.insert(nameSpace + ".writeqna", vo);
	}

	/**
	 * QnA 카테고리 불러오기
	 * 
	 * @return
	 */
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
