package com.yomul.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yomul.dao.NearDAO;

@Service
public class FileUploadService {


//	HttpServletRequest request;
//	private final String SAVE_PATH = request.getSession().getServletContext().getRealPath("/");
	
	private static final String SAVE_PATH = "C:\\dev\\Sist-3\\Yomul\\src\\main\\webapp\\resources\\upload";
	private static final String PREFIX_URL = "resources/upload/";
	private static long sequence = 0L;

	public String restore(List<MultipartFile> multipartFile) {
		String url = null;
		NearDAO dao = new NearDAO();

		try {

			// 파일 정보
			List<MultipartFile> originFilenameList = multipartFile;
			for (MultipartFile mf : originFilenameList) {
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
				
				writeFile(multipartFile, saveFileName);
				url = PREFIX_URL + saveFileName;
				
				System.out.println("url :" + url );
			}

		} catch (IOException e) {

			throw new RuntimeException(e);
		}
		return url;
	}

	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "near";

		fileName += (++sequence)+extName;

		return fileName;
	}

	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(List<MultipartFile> multipartFile, String saveFileName) throws IOException {
		boolean result = false;

		for (MultipartFile mf : multipartFile) {
			byte[] data = mf.getBytes();
			FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
			fos.write(data);
			fos.close();
		}
		
		return result;
	}
}
