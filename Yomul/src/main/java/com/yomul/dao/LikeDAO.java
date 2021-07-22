package com.yomul.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.LikeVO;

@Repository
public class LikeDAO extends DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String nameSpace = "mapper.like";

	/**
	 * 좋아요 여부 확인
	 * 
	 * @param vo
	 * @return
	 */
	public int isLiked(LikeVO vo) {
		System.out.println(vo.toStringJson());
		return sqlSession.selectOne(nameSpace + ".isLiked", vo);
	}

	/**
	 * 좋아요 취소
	 * 
	 * @param vo
	 * @return
	 */
	public int unLike(LikeVO vo) {
		return sqlSession.delete(nameSpace + ".unLike", vo);
	}

	/**
	 * 좋아요
	 * 
	 * @param vo
	 * @return
	 */
	public int like(LikeVO vo) {
		return sqlSession.insert(nameSpace + ".like", vo);
	}

	/**
	 * 좋아요 취소
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteLike(LikeVO vo) {
		return sqlSession.delete(nameSpace + ".deleteLike", vo);
	}

	// 좋아요 추가
	public int addLike(HashMap<String, String> params) {
		try {
			sqlSession.insert(nameSpace + ".insertLike", params);
		} catch (Exception e) { // 실패 시 0 반환
			return 0;
		}

		// 성공 시 해당 글의 현재 좋아요 수 반환
		return getLikeCount(params.get("ano"));
	}

	// 좋아요 수 확인
	public int getLikeCount(String ano) {
		try {
			return sqlSession.selectOne(nameSpace + ".selectLikeCount", ano);
		} catch (NullPointerException e) { // 해당 게시글의 좋아요가 하나도 없을 시 널포인터 예외 발생
			return 0;
		}
	}
}
