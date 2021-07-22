package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.ProductVO;

public interface ProductService {
	
	int getDelete(int no);
	
	int getProductWrite(ProductVO pvo);

	String getProductSequence();

	ArrayList<ProductVO> getProductList(ProductVO product, String page);

	ProductVO getProductInfo(String no);
	
	ArrayList<CategoryVO> getProductCategories();
}
