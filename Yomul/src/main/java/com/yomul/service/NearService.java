package com.yomul.service;

import java.util.ArrayList;
import java.util.List;

import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;

public interface NearService {
	// 내근처 글쓰기
	int getNearWrite(NearVO vo, String url);
	
	// 업체 소식 추가
	String insertVendorNews(NearVO vo);
	
	// 해당 유저의 최근 게시글 번호 불러오기
	String getStoredArticleNo(String no);
	
	// 내근처 파일 등록
	int getNearFile(String saveFileName, String originFilename);

	// 내 근처 홈 화면 보기
	List<NearVO> selectNearList(NearVO vo);
	
	// 내 근처 카드 폼 화면 보기
	List<NearVO> selectNearCardList(NearVO vo, String word);

	// 내 근처 글 수정
	int getUpdate(NearVO vo, String no);
	
	// 내 근처 글 삭제
	int getDelete(int no);

	// 내 근처 게시글 상세보기
	NearVO getNearInfo(String no);

	// 내 근처 게시글 조회수 업데이트
	int updateNearHits(String no);

	ArrayList<NearVO> getNearList(NearVO near, String page);

	int deleteNear(MemberVO member, NearVO near);
	
	String getArticeNo();
	
	ArrayList<NearVO> getMyArticleList(MemberVO member, String page);
}
