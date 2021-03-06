package com.yomul.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.yomul.dao.NearDAO;

import com.yomul.service.FileService;
import com.yomul.vo.FileVO;

@Service("fileUtils")
public class FileUtils {

	@Autowired
	private FileService fileService;

	@Autowired
	private NearDAO dao;

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

	public static String getUploadPath(HttpSession session) {
		return session.getServletContext().getRealPath("/resources/upload");
	}

	// 파일을 DB와 서버에 업로드
	public int uploadFile(FileVO vo, MultipartFile multifile, HttpServletRequest request) {
		// DB에 파일 정보 업로드
		int result = fileService.uploadFile(vo);
		if (result == 1) {
			try { // 서버에 파일 정보 업로드
				File file = new File(getUploadPath(request), vo.getSavedFilename());
				multifile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 내근처 글쓰기 파일업로드
	// 파일업로드 갯수 확인
	public int getUploadedCount(List<MultipartFile> multipartFile) {
		int count = 0;
		for (MultipartFile mf : multipartFile) {
			if (!mf.isEmpty()) {
				count += 1;
			}
		}
		return count;
	}

	public String restore(String articleNo, List<MultipartFile> multipartFile, HttpServletRequest request) {
		String url = null;
		try {
			// 파일 정보
			for (MultipartFile mf : multipartFile) {
				// 원파일명
				String originFilename = mf.getOriginalFilename();
				// 파일 크기
				Long size = mf.getSize();

				// 서버에서 저장 할 파일 이름 // 이 부분 변경
				String saveFileName = articleNo;
				// db에 저장
				dao.getNearFile(saveFileName, originFilename);
				// 파일 생성
				writeFile(mf, originFilename, request);
				url = originFilename;
			}

		} catch (IOException e) {

			throw new RuntimeException(e);
		}
		return url;
	}

	/*
	 * // 중복되지 않게 현재 시간 붙여서 파일 이름 생성 public String genSaveFileName(String articleNo,
	 * String extName) { String fileName = articleNo + "_" + (++SEQUENCE) + "_" +
	 * extName;
	 * 
	 * return fileName; }
	 */

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
	private boolean writeFile(MultipartFile mf, String originFilename, HttpServletRequest request) throws IOException {
		final String SAVE_PATH = request.getSession().getServletContext().getRealPath("/resources/upload");
		boolean result = false;
		byte[] data = mf.getBytes();

		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + originFilename);
		fos.write(data);
		fos.close();

		return result;
	}

}
