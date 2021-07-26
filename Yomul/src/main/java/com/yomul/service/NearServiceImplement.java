package com.yomul.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.NearDAO;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;
import com.yomul.vo.VendorVO;

@Service("nearService")
public class NearServiceImplement implements NearService {

	@Autowired
	private NearDAO nearDAO;

	@Override
	public int getNearWrite(NearVO vo, String url) {
		return nearDAO.getNearWrite(vo, url);
	}

	@Override
	public int insertVendorNews(VendorVO vendor, NearVO vo , String url) {
		return nearDAO.insertVendorNews(vendor ,vo, url);
	}
	
	// 해당 유저의 최근 게시글 번호 불러오기
	@Override
	public String getStoredArticleNo(String no) {
		return nearDAO.getStoredArticleNo(no);
	}
	
	@Override
	public NearVO getNearInfo(String no) {
		return nearDAO.getNearInfo(no);
	}

	@Override
	public int updateNearHits(String no) {
		return nearDAO.updateNearHits(no);
	}

	@Override
	public List<NearVO> selectNearList(NearVO vo) {
		return nearDAO.getList(vo);
	}

	@Override
	public ArrayList<NearVO> getNearList(NearVO near, String page) {
		return nearDAO.getNearList(near, page);
	}

	@Override
	public int deleteNear(MemberVO member, NearVO near) {
		return nearDAO.deleteNear(member, near);
	}

	@Override
	public int getNearFile(String saveFileName, String originFilename) {
		return nearDAO.getNearFile(saveFileName, originFilename);
	}

	@Override
	public int getUpdate(NearVO vo, String no) {
		return nearDAO.getUpdate(vo, no);
	}

	@Override
	public int getDelete(int no) {
		return 0;
	}

	@Override
	public List<NearVO> selectNearCardList(NearVO vo, String word) {
		return nearDAO.selectNearCardList(vo, word);
	}

	@Override
	public String getArticeNo() {
		return nearDAO.getArticeNo();
	}

	@Override
	public ArrayList<NearVO> getMyArticleList(MemberVO member, String page) {
		return nearDAO.getMyArticleList(member, page);
	}

	@Override
	public List<NearVO> viewInfo(NearVO vo, String no) {
		return nearDAO.viewInfo(vo,no);
	}

	@Override
	public ArrayList<FileVO> getFileList(String no) {
		return nearDAO.getFileList(no);
	}

}
