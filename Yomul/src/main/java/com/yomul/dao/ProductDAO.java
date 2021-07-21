package com.yomul.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.mybatis.spring.SqlSessionTemplate;

import com.yomul.vo.ProductVO;

@Repository
public class ProductDAO extends DAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.product";

	
	//글작성 데이터 저장
	public int getProductWrite(ProductVO pvo) {
		return sqlSession.insert(namespace +".getProductWrite",pvo);
	}

 
	public ArrayList<ProductVO> getProductList(ProductVO vo) {
		List<ProductVO> list = sqlSession.selectList(namespace + ".getProductList", vo);
		return (ArrayList<ProductVO>) list;
	}

}
