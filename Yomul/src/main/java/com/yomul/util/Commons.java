package com.yomul.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Commons {
	// 저장하는 파일 이름을 구하는 함수
	public static String getFileName(String articleNo, MultipartFile file) {
		return articleNo + "_1_" + file.getOriginalFilename();
	}
	
	// 저장하는 파일 이름을 구하는 함수(파일 여러 개)
	public static String[] getFileName(String articleNo, MultipartFile[] files) {
		String[] result = new String[files.length];
		for(int i=1;i<=files.length;i++) {
			result[i] = articleNo + "_" + i + "_" + files[i].getOriginalFilename();
		}
		return result;
	}
	
	// 파일 저장 경로를 구하는 함수
	public static String getUploadPath(HttpServletRequest request) {
		return request.getSession().getServletContext().getRealPath("/resources/upload");
	}
}
