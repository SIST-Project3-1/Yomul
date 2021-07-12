package com.yomul.yomul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yomul.service.FileUploadService;

@Controller
public class FileUploadController {
	@Autowired
	FileUploadService fileUploadService;
	

	//내근처 글쓰기 파일 업로드
	@RequestMapping(value="/upload_file_proc" ,method=RequestMethod.POST)
	public String upload(Model model, @RequestParam("uploadFile") List<MultipartFile> files) {
		String url = fileUploadService.restore(files);
		model.addAttribute("url", url);
		return "redirect:/near_write";
	}
}