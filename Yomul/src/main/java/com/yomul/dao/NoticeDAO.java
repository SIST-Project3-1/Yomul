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

//반환형이 int인 경우 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2
@Repository
public class NoticeDAO extends DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String namespace = "mapper.Notice";

	/**
	 * 공지사항 삭제
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteNotice(NoticeVO vo) {
		System.out.println(vo.toStringJson());
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

	/**
	 * 프로필 사진 가져오기
	 * 
	 * @param vo
	 * @return
	 */
	public FileVO getMyProfileImg(NoticeVO vo) {
		return sqlSession.selectOne(namespace + ".getmyprofileimg", vo);
	}

	/**
	 * 프로필 정보 업데이트
	 * 
	 * @param vo
	 * @return
	 */
	public int setMyProfileInfo(NoticeVO vo) {
		return sqlSession.insert(namespace + ".setmyprofileinfo", vo);
	}

}
