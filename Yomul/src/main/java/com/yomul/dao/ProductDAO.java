package com.yomul.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.yomul.vo.ProductVO;

@Repository
public class ProductDAO extends DAO {

	private static String namespace = "mapper.product";

	public ArrayList<ProductVO> getProductList(ProductVO vo) {
		List<ProductVO> list = sqlSession.selectList(namespace + ".getProductList", vo);
		return (ArrayList<ProductVO>) list;
	}

}
