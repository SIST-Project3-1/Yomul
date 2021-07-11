package com.yomul.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.NoticeVO;

public class CustomerCenterDAO extends DAO {
	
	// faq 카테고리 목록 구하기
	public ArrayList<CategoryVO> getFaqCategories() {
		ArrayList<CategoryVO> list = new ArrayList<CategoryVO>();
		CategoryVO vo = null;
		
		try {
			String sql = " select no, content from yomul_faq_categories order by no asc ";
			
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new CategoryVO();
				
				vo.setNo(rs.getInt(1));
				vo.setContent(rs.getString(2));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// faq 목록 반환
	public ArrayList<FaqVO> getFaqList() {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		FaqVO vo = null;
		
		try {
			String sql = " select category, title, content from yomul_faq_articles order by no asc ";
			
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new FaqVO();
				
				vo.setCategory(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 사용자 공지사항 목록 조회
	public ArrayList<NoticeVO> getNoticeList() {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO vo = null;
		
		try {
			String sql = " select no, title, ndate from yomul_notices ";
			
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new NoticeVO();
				
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setDate(rs.getString(3));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 사용자 공지사항 상세 조회
	public NoticeVO getNoticeInfo(int no) {
		NoticeVO vo = null;
		
		try {
			String sql = " select title, content, ndate, hits "
					+ " from yomul_notices "
					+ " where no = ? ";
			
			getPreparedStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new NoticeVO();
				
				vo.setTitle(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setDate(rs.getString(3));
				vo.setHits(rs.getInt(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	// 공지사항 조회수 추가
	public int addNoticeHits(int no) {
		int result = -1;
		try {
			String sql = " update yomul_notices "
					+ " set hits = hits + 1 "
					+ " where no = ? ";
			
			getPreparedStatement(sql);
			
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
