package com.yomul.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.yomul.dao.CommentDAO;
import com.yomul.vo.CommentVO;

public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO commentDAO;
	
	public ArrayList<CommentVO> getCommentList(String no, int page) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("no", no);
		params.put("page", page);
		params.put("perPage", 10);
		
		return commentDAO.getComments(params);
	}
	
	public int getCommentCount(String no) {
		return commentDAO.getCommentCount(no);
	}
}
