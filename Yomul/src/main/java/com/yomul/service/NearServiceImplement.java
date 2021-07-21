package com.yomul.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yomul.dao.NearDAO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;

@Service("nearService")
public class NearServiceImplement implements NearService {

	@Autowired
	private NearDAO nearDAO;

	@Override
	public int getNearWrite(NearVO vo) {
		return nearDAO.getNearWrite(vo);
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
	public int getUpdate(NearVO vo) {
		
		return 0;
	}

	@Override
	public int getDelete(int no) {
		
		return 0;
	}

	@Override
	public List<NearVO> selectNearCardList(NearVO vo, String word) {
		
		return nearDAO.selectNearCardList(vo,word);
	}

	@Override
	public String getArticeNo() {
	
		return nearDAO.getArticeNo();
	}
	
	
}
