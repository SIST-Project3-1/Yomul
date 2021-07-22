package com.yomul.service;

import com.yomul.vo.LikeVO;

public interface LikeService {

	// 좋아요 추가
	int insertLike(String ano, String mno);

	// 좋아요 갯수 조회
	int getLikeCount(String no);

	boolean isLiked(LikeVO vo);

	int unLike(LikeVO vo);

	int like(LikeVO vo);
}
