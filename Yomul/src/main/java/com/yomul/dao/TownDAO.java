package com.yomul.dao;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.FileVO;
import com.yomul.vo.TownVO;

@Repository
public class TownDAO extends DAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String nameSpace = "mapper.town";
	
	//동네생활 글 쓰기
	public int getTownWrite(TownVO town, FileVO file) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("town", town);
		map.put("file", file);
		return sqlSession.insert(nameSpace + ".getTownWrite", map);
	}

	
	
}