package com.yomul.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.ProductDAO;
import com.yomul.dao.TradeHistoryDAO;
import com.yomul.vo.CategoryVO;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ProductVO;
import com.yomul.vo.TradeHistoryVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private TradeHistoryDAO tradeHistoryDAO;

	@Override
	public int getDelete(MemberVO member, ProductVO pvo) {
		return productDAO.deleteProduct(member, pvo);
	}

	@Override
	public String getProductSequence() {
		return productDAO.getProductSequence();
	}

	@Override
	public ArrayList<CategoryVO> getProductCategories() {
		return productDAO.getProductCategories();
	}

	@Override
	public int getProductWrite(ProductVO pvo) {
		return productDAO.getProductWrite(pvo) == 1 ? 1 : 0;
	}

	@Override
	public ArrayList<ProductVO> getProductList(ProductVO product, String page) {
		return productDAO.getProductList(product, page);
	}

	@Override
	public ProductVO getProductInfo(String no) {
		return productDAO.getProductInfo(no);
	}

	@Override
	public int getTotalPageCount(String search) {
		return productDAO.getTotalPageCount(search);
	}

	@Override
	public ArrayList<ProductVO> getProductList(int page, String search) {
		return productDAO.getProductList(page, search);
	}

	@Override
	public int sellProduct(TradeHistoryVO vo) {
		int result = 0;
		result = productDAO.sellProduct(vo);
		if (result == 1) {
			result = tradeHistoryDAO.sellProduct(vo);
		}
		return result;
	}

	@Override
	public ArrayList<FileVO> getProductImg(ProductVO product) {
		return productDAO.getProductImg(product);
	}

}
