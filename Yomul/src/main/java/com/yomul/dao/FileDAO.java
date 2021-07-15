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

	/**
	 * 작성된 글의 파일 목록을 받아서 ArrayList로 반환
	 * 
	 * @param no
	 * @return
	 */
	public ArrayList<FileVO> getFileList(String no) {
		List<FileVO> list = sqlSession.selectList(namespace + ".getfilelist", no);
		return (ArrayList<FileVO>) list;
	}

	/** 게시글 파일 조회 **/
	public ArrayList<String> getArticleFiles(String no) {
		List<String> list = sqlSession.selectList("mapper.file.selectArticleFiles", no);
		return (ArrayList<String>) list;
	}

}
