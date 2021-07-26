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
	public int updateNotice(NoticeVO vo, int no) {
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("no", "N"+no);
		params.put("vo", vo);
		return sqlSession.update(namespace + ".updateNotice", params);
	}

	/**
	 * 공지사항 삭제
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteNotice(NoticeVO vo, int no) {
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("no", "N"+no);
		params.put("vo", vo);
		return sqlSession.update(namespace + ".deleteNotice", params);
	}

	/**
	 * 공지사항 목록 가져오기
	 * 
	 * @return
	 */
	public ArrayList<NoticeVO> getNoticeList(String page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		List<NoticeVO> list = sqlSession.selectList(namespace + ".getNoticeList", map);
		return (ArrayList<NoticeVO>) list;
	}
	// 공지사항 상세 조회
	public NoticeVO getNoticeInfo(String no) {
		return sqlSession.selectOne(namespace + ".selectNoticeInfo", no);
	}
	/**
	 * 총 페이지 수 가져오기
	 * 
	 * @return
	 */
	public int getTotalPageCount() {
		return sqlSession.selectOne(namespace + ".gettotalpagecount");
	}
}
