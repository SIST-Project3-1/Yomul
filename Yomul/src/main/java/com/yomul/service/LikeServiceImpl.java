package com.yomul.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.yomul.dao.LikeDAO;

public class LikeServiceImpl implements LikeService {
	@Autowired
	LikeDAO likeDAO;
	
	
	// 좋아요 추가
	@Override
	public int insertLike(String ano, String mno) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("ano", ano);
		params.put("mno", mno);
		
		return likeDAO.addLike(params);
	}
	
	// 좋아요 갯수 조회
	@Override
	public int getLikeCount(String ano) {
		return likeDAO.getLikeCount(ano);
	}
}
