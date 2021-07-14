package com.yomul.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.FileVO;

@Repository
public class FileDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String namespace = "mapper.file";

	/**
	 * 파일 업로드
	 * 
	 * @param vo
	 * @return
	 */
	public int uploadFile(FileVO vo) {
		return sqlSession.insert(namespace + ".uploadfile", vo);
	}

	/** 게시글 파일 조회 **/
	public ArrayList<String> getArticleFiles(String board, int no) {
		List<String> list = sqlSession.selectList("mapper.file.selectArticleFiles", board + no);
		return (ArrayList<String>) list;
	}
	
	/** 게시글 파일 조회 **/
	public ArrayList<String> getArticleFiles(String no) {
		List<String> list = sqlSession.selectList("mapper.file.selectArticleFiles", no);
		return (ArrayList<String>) list;
	}
}
