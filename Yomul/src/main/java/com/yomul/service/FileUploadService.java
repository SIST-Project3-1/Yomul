package com.yomul.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	private static final String SAVE_PATH = "/upload";
	private static final String PREFIX_URL = "/upload/";

	public String restore(List<MultipartFile> multipartFile) {
		String url = null;

		try {

			// 파일 정보
			List<MultipartFile> originFilenameList = multipartFile;
			for (MultipartFile mf : originFilenameList) {
				String originFilename = mf.getOriginalFilename();
				String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
				Long size = mf.getSize();
				
				// 서버에서 저장 할 파일 이름
				String saveFileName = genSaveFileName(extName);
				
				System.out.println("originFilename : " + originFilename);
				System.out.println("extensionName : " + extName);
				System.out.println("size : " + size);
				System.out.println("saveFileName : " + saveFileName);
				
				writeFile(multipartFile, saveFileName);
				url = PREFIX_URL + saveFileName;
				
			}

		} catch (IOException e) {

			throw new RuntimeException(e);
		}
		return url;
	}

	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";

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

	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(List<MultipartFile> multipartFile, String saveFileName) throws IOException {
		boolean result = false;

		for (MultipartFile mf : multipartFile) {
			FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
			fos.close();
		}
		
		return result;
	}
}
