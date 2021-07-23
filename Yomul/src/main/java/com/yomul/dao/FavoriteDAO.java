package com.yomul.dao;

import org.springframework.stereotype.Repository;

import com.yomul.vo.FavoriteVO;

@Repository
public class FavoriteDAO extends DAO {

	private String nameSpace = "mapper.favorite";

	public int getFavoriteCount(String no) {
		return sqlSession.selectOne(nameSpace + ".getFavoriteCount", no);
	}

	public int isFavorite(FavoriteVO vo) {
		return sqlSession.selectOne(nameSpace + ".isFavorite", vo);
	}

	public int unFavorite(FavoriteVO vo) {
		return sqlSession.delete(nameSpace + ".unFavorite", vo);
	}

	public int favorite(FavoriteVO vo) {
		return sqlSession.insert(nameSpace + ".favorite", vo);
	}
}
