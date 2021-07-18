package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.CommentVO;
import com.yomul.vo.MemberVO;

@Repository
public class CommentDAO extends DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String nameSpace = "mapper.comment";

	/**
	 * 내가 쓴 댓글 목록 조회
	 * 
	 * @param vo
	 * @param page
	 * @return
	 */
	public ArrayList<CommentVO> getCommentList(MemberVO vo, int page) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("no", vo.getNo());
		params.put("page", page);
		List<CommentVO> list = sqlSession.selectList(nameSpace + ".getCommentList", params);
		return (ArrayList<CommentVO>) list;
	}

	// 댓글 목록 조회
	public ArrayList<CommentVO> getComments(HashMap<String, Object> params) {
		List<CommentVO> list = sqlSession.selectList(nameSpace + ".selectCommentList", params);
		return (ArrayList<CommentVO>) list;
	}

	// 댓글 갯수 조회
	public int getCommentCount(String no) {
		try {
			return sqlSession.selectOne(nameSpace + ".selectCommentCount", no);
		} catch (NullPointerException e) { // 댓글이 없을 경우 널포인터예외 발생
			return 0;
		}
	}

	// 댓글 작성
	public String addComment(CommentVO vo) {
		try {
			sqlSession.insert(nameSpace + ".insertComment", vo);
		} catch (Exception e) { // 작성 실패 시 0 반환
			return "0";
		}

		// 작성 성공 시 작성한 댓글 번호를 반환
		return getLastCommentNo(vo);
	}

	// 작성한 댓글 번호 조회
	public String getLastCommentNo(CommentVO vo) {
		return sqlSession.selectOne(nameSpace + ".selectLastCommentNo", vo);
	}
}
