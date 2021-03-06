package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ProductVO;
import com.yomul.vo.TradeHistoryVO;

public interface ProductService {

	int getDelete(MemberVO member, ProductVO pvo);

	int getProductWrite(ProductVO pvo);

	String getProductSequence();

	ArrayList<ProductVO> getProductList(ProductVO product, String page, String search);

	ProductVO getProductInfo(String no);

	ArrayList<CategoryVO> getProductCategories();

	int getTotalPageCount(String search);

	ArrayList<ProductVO> getProductList(int page, String search);

	int sellProduct(TradeHistoryVO vo);

	ArrayList<FileVO> getProductImg(ProductVO product);

	int updateProduct(ProductVO vo);
}
