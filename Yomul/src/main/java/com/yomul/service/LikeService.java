package com.yomul.service;

public interface LikeService {

	// 좋아요 추가
	public int insertLike(String ano, String mno);
	
	// 좋아요 갯수 조회
	public int getLikeCount(String no);
}
