package com.yomul.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.FavoriteDAO;
import com.yomul.vo.FavoriteVO;

@Service("favoriteService")
public class FavoriteServiceImpl implements FavoriteService {

	@Autowired
	private FavoriteDAO favoriteDAO;

	@Override
	public int getFavoriteCount(String no) {
		return favoriteDAO.getFavoriteCount(no);
	}

	@Override
	public int isFavorite(FavoriteVO vo) {
		return favoriteDAO.isFavorite(vo);
	}

	@Override
	public int unFavorite(FavoriteVO vo) {
		return favoriteDAO.unFavorite(vo);
	}

	@Override
	public int favorite(FavoriteVO vo) {
		return favoriteDAO.favorite(vo);
	}

}
