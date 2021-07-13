package com.yomul.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yomul.dao.NearDAO;

@Service
public class File {
	
	
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
	
	// 내근처 글쓰기 파일업로드 
	//파일업로드 갯수 확인
	public int getUploadedCount(List<MultipartFile> multipartFile) {
		int count = 0;
		for (MultipartFile mf : multipartFile) {
			if (!mf.isEmpty()) {
				count += 1;
			}
		}
		return count;
	}
	public String restore(List<MultipartFile> multipartFile,NearDAO dao, HttpServletRequest request) {
		String url = null;
		final String PREFIX_URL = "resources/upload/";
		try {
			// 파일 정보
			for (MultipartFile mf : multipartFile) {
				//원파일명
				String originFilename = mf.getOriginalFilename();
				//변환 파일명
				String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
				//파일 크기
				Long size = mf.getSize();
				
				// 서버에서 저장 할 파일 이름
				String saveFileName = genSaveFileName(extName);
				//db에 저장
				dao.getNearFile(saveFileName,originFilename);
				
				System.out.println("originFilename : " + originFilename);
				System.out.println("extensionName : " + extName);
				System.out.println("size : " + size);
				System.out.println("saveFileName : " + saveFileName);
				
				writeFile(mf, saveFileName, request);
				url = PREFIX_URL + saveFileName;
				
				System.out.println("url :" + url );
			}

		} catch (IOException e) {

			throw new RuntimeException(e);
		}
		return url;
	}
	// 중복되지 않게 현재 시간 붙여서 파일 이름 생성
	public String genSaveFileName(String extName) {
	
		String fileName = "near";
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;

		return fileName;
	}

	// 파일을 실제로 저장
	private boolean writeFile(MultipartFile mf, String saveFileName, HttpServletRequest request) throws IOException {
		final String SAVE_PATH = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("save_path ===> " + SAVE_PATH);
		boolean result = false;
		
			byte[] data = mf.getBytes();
			System.out.println("data : " + data);
			
			FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
			fos.write(data);
			fos.close();
		
		
		return result;
	}
	
	
	
	
	
}
