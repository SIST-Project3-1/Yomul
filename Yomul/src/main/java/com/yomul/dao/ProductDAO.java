package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public ArrayList<ProductVO> getProductList(ProductVO product, String page) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("no", product.getNo());
		params.put("page", page);
		List<ProductVO> list = sqlSession.selectList(namespace + ".getProductList", params);
		return (ArrayList<ProductVO>) list;
	}

	public ProductVO getProductInfo(String no) {
		return sqlSession.selectOne(namespace + ".getProductInfo", no);
	}

}
