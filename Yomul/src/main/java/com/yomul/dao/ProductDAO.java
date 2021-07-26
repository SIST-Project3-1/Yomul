package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ProductVO;
import com.yomul.vo.TradeHistoryVO;

@Repository
public class ProductDAO extends DAO {

	private static String namespace = "mapper.product";

	/**
	 * 물건 판매 상태로 변경
	 * 
	 * @param vo
	 * @return
	 */
	public int sellProduct(TradeHistoryVO vo) {
		return sqlSession.update(namespace + ".sellProduct", vo);
	}

	/**
	 * 물건 목록 가져오기
	 * 
	 * @return
	 */
	public ArrayList<ProductVO> getProductList(int page, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("search", search);
		List<ProductVO> list = sqlSession.selectList(namespace + ".getProductList2", map);
		return (ArrayList<ProductVO>) list;
	}

	/**
	 * 총 페이지 수 가져오기
	 * 
	 * @param search
	 * @return
	 */
	public int getTotalPageCount(String search) {
		return sqlSession.selectOne(namespace + ".getTotalPageCount", search);
	}

	/**
	 * 상품 삭제
	 * 
	 * @param member
	 * @param product
	 * @return
	 */
	public int deleteProduct(MemberVO member, ProductVO product) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member", member);
		params.put("product", product);
		return sqlSession.delete(namespace + ".deleteProduct", params);
	}

	// 글작성 no 시퀀스 불러오기
	public String getProductSequence() {
		return sqlSession.selectOne(namespace + ".getProductSequence");
	}

	// 글작성 카테고리
	public ArrayList<CategoryVO> getProductCategories() {
		List<CategoryVO> list = sqlSession.selectList(namespace + ".getProductCategories");
		return (ArrayList<CategoryVO>) list;
		// sqlSession.selectList의 리턴 타입이 List여서 List를 붙이고 그 후 ArrayList를 위해return에서 형변환
	}

	// 글작성 데이터 저장
	public int getProductWrite(ProductVO pvo) {
		return sqlSession.insert(namespace + ".getProductWrite", pvo);
	}

	/**
	 * 물품 목록 불러오기
	 * 
	 * @param product
	 * @param page
	 * @return
	 */
	public ArrayList<ProductVO> getProductList(ProductVO product, String page, String search) {
		Map<String, Object> params = new HashMap<String, Object>();
		if (product != null) {
			params.put("no", product.getNo());
		}
		params.put("page", page);
		params.put("search", search);
		List<ProductVO> list = sqlSession.selectList(namespace + ".getProductList", params);
		return (ArrayList<ProductVO>) list;
	}

	/**
	 * 물품 이미지 불러오기
	 * 
	 * @param article_no
	 * @return
	 */
	public ArrayList<FileVO> getProductImg(ProductVO product) {
		List<FileVO> list = sqlSession.selectList(namespace + ".getProductImg", product);
		return (ArrayList<FileVO>) list;
	}

	/**
	 * 물품 상세 정보 불러오기
	 * 
	 * @param no
	 * @return
	 */
	public ProductVO getProductInfo(String no) {
		return sqlSession.selectOne(namespace + ".getProductInfo", no);
	}

}
