package com.yomul.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yomul.vo.FileVO;
import com.yomul.vo.NearVO;

@Repository
public class NearDAO extends DAO {

	private static String nameSpace = "mapper.near";

	public int getNearWrite(NearVO vo) {
		return sqlSession.insert(nameSpace + ".getNearWrite", vo);
	}

	public int getNearFile(String saveFileName, String originFilename) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("saveFileName", saveFileName);
		params.put("originFilename", originFilename);
		return sqlSession.insert(nameSpace + "getNearFile", params);
	}

	// 내 근처 글쓰기 글번호 가져오기
	public String getWriteNumber() {
		return sqlSession.selectOne(nameSpace + ".getWriteNumber");
	}

	// 내 근처 홈 글 보기
	public List<NearVO> getList(NearVO vo) {
		return sqlSession.selectList(nameSpace + ".selectNearList");
	}

	// 내 근처 게시글 상세 보기
	public NearVO getNearInfo(String no) {
		return sqlSession.selectOne(nameSpace + ".selectNearInfo", no);
	}

	// 내 근처 게시글 조회수 업데이트
	public int updateNearHits(String no) {
		return sqlSession.update(nameSpace + ".updateNearHits", no);
	}

}
