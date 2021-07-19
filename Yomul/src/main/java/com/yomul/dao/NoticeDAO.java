package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.FileVO;
import com.yomul.vo.NoticeVO;

@Repository
public class NoticeDAO extends DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String namespace = "mapper.notice";

	/**
	 * 공지사항 작성
	 * 
	 * @param vo
	 * @return
	 */
	public int writeNotice(NoticeVO vo) {
		return sqlSession.insert(namespace + ".writeNotice", vo);
	}

	/**
	 * 공지사항 수정
	 * 
	 * @param vo
	 * @return
	 */
	public int updateNotice(NoticeVO vo) {
		return sqlSession.update(namespace + ".updateNotice", vo);
	}

	/**
	 * 공지사항 삭제
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteNotice(NoticeVO vo) {
		return sqlSession.delete(namespace + ".deleteNotice", vo);
	}

	/**
	 * 공지사항 목록 가져오기
	 * 
	 * @return
	 */
	public ArrayList<NoticeVO> getNoticeList(int page, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("search", search);
		List<NoticeVO> list = sqlSession.selectList(namespace + ".getNoticelist", map);
		return (ArrayList<NoticeVO>) list;
	}

	/**
	 * 총 페이지 수 가져오기
	 * 
	 * @return
	 */
	public int getTotalPageCount(String search) {
		return sqlSession.selectOne(namespace + ".gettotalpagecount", search);
	}
}
