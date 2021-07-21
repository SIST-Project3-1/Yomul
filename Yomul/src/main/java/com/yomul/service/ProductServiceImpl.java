package com.yomul.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.ProductDAO;
import com.yomul.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Override	
	public int getProductWrite(ProductVO pvo) {
		return productDAO.getProductWrite(pvo)== 1? 1:0;
	}
	@Override
	public ArrayList<ProductVO> getProductList(ProductVO product, String page) {
		return productDAO.getProductList(product, page);
	}

	@Override
	public ProductVO getProductInfo(String no) {
		return productDAO.getProductInfo(no);
	}
	
}
