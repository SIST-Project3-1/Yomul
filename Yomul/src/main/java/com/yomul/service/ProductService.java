package com.yomul.service;

import java.util.ArrayList;

import com.yomul.vo.ProductVO;

public interface ProductService {

	ArrayList<ProductVO> getProductList(ProductVO vo);
}
