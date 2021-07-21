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
	public ArrayList<ProductVO> getProductList(ProductVO vo) {
		return productDAO.getProductList(vo);
	}
	
}
