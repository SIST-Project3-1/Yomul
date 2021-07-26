package com.yomul.dao;

import org.springframework.stereotype.Repository;

import com.yomul.vo.TradeHistoryVO;

@Repository
public class TradeHistoryDAO extends DAO {

	private static String nameSpace = "mapper.tradehistory";

	/**
	 * 물건 판매 처리
	 * 
	 * @param vo
	 * @return
	 */
	public int sellProduct(TradeHistoryVO vo) {
		return sqlSession.insert(nameSpace + ".sellProduct", vo);
	}
}
