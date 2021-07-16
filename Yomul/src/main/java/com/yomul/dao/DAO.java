package com.yomul.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

abstract public class DAO {

	@Autowired
	protected SqlSessionTemplate sqlSession;

}
