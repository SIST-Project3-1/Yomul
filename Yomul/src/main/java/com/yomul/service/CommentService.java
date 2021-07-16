package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.CommentVO;

public interface CommentService {

	// 게시글 댓글 조회
	public ArrayList<CommentVO> getCommentList(String no, int page);
	
	// 게시글 댓글 갯수 조회
	public int getCommentCount(String no);
	
	// 댓글 작성
	public int addComment(CommentVO vo);
}
