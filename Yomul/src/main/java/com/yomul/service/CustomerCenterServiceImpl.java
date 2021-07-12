package com.yomul.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.CustomerCenterDAO;
import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.NoticeVO;
import com.yomul.vo.QnaVO;

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
	public ArrayList<NoticeVO> getNoticeList() {
		return customerCenterDAO.getNoticeList();
	}

	@Override
	public NoticeVO getNoticeInfo(int no) {
		return customerCenterDAO.getNoticeInfo("N" + no);
	}

	@Override
	public int addNoticeHits(int no) {
		return customerCenterDAO.addNoticeHits("N" + no);
	}

	@Override
	public ArrayList<String> getNoticeFiles(int no) {
		return customerCenterDAO.getArticleFiles("N", no);
	}

	@Override
	public ArrayList<CategoryVO> getQnaCategories() {
		return customerCenterDAO.getQnaCategories();
	}

	@Override
	public int writeQna(QnaVO vo) {
		return customerCenterDAO.writeQna(vo) == 1 ? 1 : 0;
	}

	@Override
	public String getNextQnaNo() {
		return customerCenterDAO.getNextQnaNo();
	}
}
