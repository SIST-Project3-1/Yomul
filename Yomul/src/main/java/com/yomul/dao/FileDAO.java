package com.yomul.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.FileVO;

@Repository
public class FileDAO {

	@Autowired
	private SqlSessionTemplate sqlSessiion;

	private static String namespace = "mapper.file";

	/**
	 * 파일 업로드
	 * 
	 * @param vo
	 * @return
	 */
	public int uploadFile(FileVO vo) {
		return sqlSessiion.insert(namespace + ".uploadfile", vo);
	}

}
