package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yomul.vo.ProductVO;

@Repository
public class ProductDAO extends DAO {

	private static String namespace = "mapper.product";

	public ArrayList<ProductVO> getProductList(ProductVO product, String page) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("no", product.getNo());
		params.put("page", page);
		List<ProductVO> list = sqlSession.selectList(namespace + ".getProductList", params);
		return (ArrayList<ProductVO>) list;
	}

}
