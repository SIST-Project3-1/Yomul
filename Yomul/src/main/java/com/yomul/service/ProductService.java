package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.ProductVO;

public interface ProductService {
	
	int getProductWrite(ProductVO pvo);

	ArrayList<ProductVO> getProductList(ProductVO vo);
}
