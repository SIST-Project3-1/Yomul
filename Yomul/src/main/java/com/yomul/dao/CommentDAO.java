package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.yomul.vo.CommentVO;

public class CommentDAO extends DAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String nameSpace = "mapper.comment";
	
	// 댓글 목록 조회
	public ArrayList<CommentVO> getComments(HashMap<String, Object> params) {
		List<CommentVO> list = sqlSession.selectList(nameSpace + ".selectCommentList", params);
		return (ArrayList<CommentVO>) list;
	}

}
