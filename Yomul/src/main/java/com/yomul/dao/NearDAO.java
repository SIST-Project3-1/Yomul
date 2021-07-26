package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;

@Repository
public class NearDAO extends DAO {

	private static String nameSpace = "mapper.near";

	/**
	 * 내가 쓴 글 불러오기
	 * 
	 * @param member
	 * @return
	 */
	public ArrayList<NearVO> getMyArticleList(MemberVO member, String page) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member", member);
		params.put("page", page);
		List<NearVO> list = sqlSession.selectList(nameSpace + ".getMyArticleList", params);
		return (ArrayList<NearVO>) list;
	}

	/**
	 * 내 근처 글 삭제
	 * 
	 * @param member
	 * @param near
	 * @return
	 */
	public int deleteNear(MemberVO member, NearVO near) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member", member);
		params.put("near", near);
		return sqlSession.delete(nameSpace + ".deleteNear", params);
	}

	/**
	 * 내 근처 글 10개씩 불러오기
	 * 
	 * @param near - 검색 조건
	 * @param page - 검색 페이지
	 * @return
	 */
	public ArrayList<NearVO> getNearList(NearVO near, String page) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("near", near);
		params.put("page", page);
		List<NearVO> list = sqlSession.selectList(nameSpace + ".getNearList", params);
		return (ArrayList<NearVO>) list;
	}

	public int getNearWrite(NearVO vo, String url) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("url", url);
		return sqlSession.insert(nameSpace + ".getNearWrite", params);
	}
	
	// 업체 소식 추가
	public String insertVendorNews(NearVO vo) {
		int result = sqlSession.insert(nameSpace + ".insertVendorNews", vo);
		if(result == 0) { // 저장에 실패한 경우 0 반환
			return "0";
		}
		return getStoredArticleNo(vo.getVno());
	}
	
	// 작성 완료 시 저장된 게시글 번호 불러오기
	public String getStoredArticleNo(String no) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("no", no);
		return sqlSession.selectOne(nameSpace + ".selectStoredArticleNo", params);
	}

	public int getNearFile(String saveFileName, String originFilename) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("saveFileName", saveFileName);
		params.put("originFilename", originFilename);
		return sqlSession.insert(nameSpace + ".getNearFile", params);
	}

	// 내 근처 글쓰기 글번호 가져오기
	public String getWriteNumber() {
		return sqlSession.selectOne(nameSpace + ".getWriteNumber");
	}

	// 내 근처 홈 글 보기, 최근 3개
	public List<NearVO> getList(NearVO vo) {
		return sqlSession.selectList(nameSpace + ".selectNearList");
	}

	public String getArticeNo() {
		return sqlSession.selectOne(nameSpace + ".getArticeNo");
	}

	// 내 근처 카드 형식 글 보기
	public List<NearVO> selectNearCardList(NearVO vo, String word) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("word", word);
		params.put("vo", vo);
		List<NearVO> list = sqlSession.selectList(nameSpace + ".selectNearCardList", params);
		return list;
	}

	// 내 근처 게시글 상세 보기
	public NearVO getNearInfo(String no) {
		return sqlSession.selectOne(nameSpace + ".selectNearInfo", no);
	}

	// 내 근처 게시글 조회수 업데이트
	public int updateNearHits(String no) {
		return sqlSession.update(nameSpace + ".updateNearHits", no);
	}

	public int getUpdate(NearVO vo, String no) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("no", no);
		params.put("vo", vo);
		return sqlSession.update(nameSpace + ".getUpdate", params);
	}

}
