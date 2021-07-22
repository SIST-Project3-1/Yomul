package com.yomul.service;

import com.yomul.vo.FavoriteVO;

public interface FavoriteService {

	int getFavoriteCount(String no);

	int isFavorite(FavoriteVO vo);

	int unFavorite(FavoriteVO vo);

	int favorite(FavoriteVO vo);
}
