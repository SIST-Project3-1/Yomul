package com.yomul.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yomul.service.FileService;
import com.yomul.vo.FileVO;

@Service("fileUtils")
public class FileUtils {

	@Autowired
	private FileService fileService;

	// 저장하는 파일 이름을 구하는 함수
	public static String getFileName(String articleNo, MultipartFile file) {
		return articleNo + "_1_" + file.getOriginalFilename();
	}

	// 저장하는 파일 이름을 구하는 함수(파일 여러 개)
	public static String[] getFileName(String articleNo, MultipartFile[] files) {
		String[] result = new String[files.length];
		for (int i = 1; i <= files.length; i++) {
			result[i] = articleNo + "_" + i + "_" + files[i].getOriginalFilename();
		}
		return result;
	}

	// 파일 저장 경로를 구하는 함수
	public static String getUploadPath(HttpServletRequest request) {
		return request.getSession().getServletContext().getRealPath("/resources/upload");
	}

	// 파일을 DB와 서버에 업로드
	public int uploadFile(FileVO vo, MultipartFile multifile, HttpServletRequest request) {
		// DB에 파일 정보 업로드
		int result = fileService.uploadFile(vo);
		if (result == 1) {
			try { // 서버에 파일 정보 업로드
				File file = new File(getUploadPath(request), vo.getSavedFilename());
				multifile.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
