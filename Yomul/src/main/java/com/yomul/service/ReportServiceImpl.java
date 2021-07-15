package com.yomul.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.yomul.dao.ReportDAO;

public class ReportServiceImpl implements ReportService {
	@Autowired
	ReportDAO reportDAO;
	
	// 신고 추가
	public int insertReport(String ano, String mno) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("ano", ano);
		params.put("mno", mno);
		
		return reportDAO.addReport(params);
	}
}
