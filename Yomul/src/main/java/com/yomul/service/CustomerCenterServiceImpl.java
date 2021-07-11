package com.yomul.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.CustomerCenterDAO;
import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.NoticeVO;

@Service("CustomerCenterService")
public class CustomerCenterServiceImpl implements CustomerCenterService {
	@Autowired
	private CustomerCenterDAO customerCenterDAO;
	
	@Override
	public ArrayList<CategoryVO> getFaqCategories() {
		return customerCenterDAO.getFaqCategories();
	}
	
	@Override
	public ArrayList<FaqVO> getFaqList() {
		return customerCenterDAO.getFaqList();
	}
	
	@Override
	public ArrayList<FaqVO> getFaqList(int category) {
		return customerCenterDAO.getFaqList(category);
	}
	
	@Override
	public ArrayList<NoticeVO> getNoticeList() {
		return customerCenterDAO.getNoticeList();
	}
	
	@Override
	public NoticeVO getNoticeInfo(int no) {
		return customerCenterDAO.getNoticeInfo(no);
	}
	
	@Override
	public int addNoticeHits(int no) {
		return customerCenterDAO.addNoticeHits(no);
	}
}
