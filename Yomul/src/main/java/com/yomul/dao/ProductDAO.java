package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ProductVO;

@Repository
public class ProductDAO extends DAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.product";
	
	/**
	 * 상품 삭제
	 * @param member
	 * @param product
	 * @return
	 */
	public int deleteProduct(MemberVO member, ProductVO product) {
		Map<String,Object>params = new HashMap<String,Object>();
		params.put("member", member);
		params.put("product", product);
		
		return sqlSession.delete(namespace + "deleteNear",params);
	}
	
	//글작성 no 시퀀스 불러오기
	public String getProductSequence() {
		return sqlSession.selectOne(namespace + ".getProductSequence");
	}

	//글작성 카테고리
	public ArrayList<CategoryVO> getProductCategories(){
		List<CategoryVO> list = sqlSession.selectList(namespace + ".getProductCategories");
		return (ArrayList<CategoryVO>)list;
		//sqlSession.selectList의 리턴 타입이 List여서 List를 붙이고 그 후 ArrayList를 위해return에서 형변환 
	}
	
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
