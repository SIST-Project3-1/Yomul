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

	public int uploadFile(FileVO vo) {
		return sqlSessiion.insert(namespace + ".uploadfile", vo);
	}

	public int getNextFileNo() {
		return sqlSessiion.selectOne(namespace + ".getnextfileno");
	}
}
