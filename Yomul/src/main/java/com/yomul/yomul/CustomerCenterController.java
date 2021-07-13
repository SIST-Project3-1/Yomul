package com.yomul.yomul;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HttpSessionMutexListener;

import com.yomul.service.CustomerCenterService;
import com.yomul.service.FileService;
import com.yomul.util.FileUtils;
import com.yomul.util.Security;
import com.yomul.vo.CategoryVO;
import com.yomul.vo.FaqVO;
import com.yomul.vo.FileVO;
import com.yomul.vo.NoticeVO;
import com.yomul.vo.QnaVO;

@Controller
public class CustomerCenterController {

	@Autowired
	private CustomerCenterService customerCenterService;
	@Autowired
	private FileService fileService;

	// 고객센터 메인 FAQ - 전체
	@RequestMapping(value = "customer_center", method = RequestMethod.GET)
	public ModelAndView customerCenter() {
		ModelAndView mv = new ModelAndView();

		ArrayList<CategoryVO> categories = customerCenterService.getFaqCategories(); // 카테고리 정보
		ArrayList<FaqVO> faqlist = customerCenterService.getFaqList();

		mv.setViewName("user/customer_center/faq/faq_list");
		mv.addObject("categories", categories);
		mv.addObject("faqlist", faqlist);

		return mv;
	}

	// 공지사항 목록
	@RequestMapping(value = "customer_notices", method = RequestMethod.GET)
	public ModelAndView noticeList() {
		ModelAndView mv = new ModelAndView();
		ArrayList<NoticeVO> list = customerCenterService.getNoticeList();

		mv.setViewName("user/customer_center/notice/notice_list");
		mv.addObject("list", list);

		return mv;
	}

	// 공지사항 상세
	@RequestMapping(value = "customer_notices/{no}", method = RequestMethod.GET)
	public ModelAndView noticeList(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		NoticeVO vo = customerCenterService.getNoticeInfo(no);

		// 해당 공지사항이 없을 경우 에러페이지 이동
		if (vo == null) {
			mv.setViewName("redirect:/error");
		} else {
			customerCenterService.addNoticeHits(no); // 조회수 추가
			ArrayList<String> files = fileService.getNoticeFiles(no);

			mv.setViewName("user/customer_center/notice/notice_info");
			mv.addObject("vo", vo);
			mv.addObject("files", files);
		}

		return mv;
	}

	// 문의 목록
	@RequestMapping(value = "customer_qna", method = RequestMethod.GET)
	public String qnaList() {
		return "user/customer_center/qna/qna_list";
	}

	// 문의 상세
	@RequestMapping(value = "customer_qna/{no}", method = RequestMethod.GET)
	public ModelAndView qnaInfo(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/customer_center/qna/qna_info");
		mv.addObject("no", no);

		return mv;
	}

	// 문의 작성 페이지
	@RequestMapping(value = "customer_qna/write", method = RequestMethod.GET)
	public ModelAndView qnaWrite() {
		ModelAndView mv = new ModelAndView("user/customer_center/qna/qna_write");

		mv.addObject("categories", customerCenterService.getQnaCategories());
		return mv;
	}

	/**
	 * 문의 작성 처리
	 * 
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@ResponseBody
	@RequestMapping(value = "customer_qna/write_proc", method = RequestMethod.POST)
	public String customer_qna_write_proc(QnaVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		// 비밀번호 암호화
		vo.setHashsalt(Security.getSalt());
		vo.setPw(Security.pwHashing(vo.getPw(), vo.getHashsalt()));

		// 작성될 글 번호 가져오기
		vo.setNo(customerCenterService.getNextQnaNo());
		System.out.println("컨트롤라ㅣ :" + vo.toStringDefault());
		int result = customerCenterService.writeQna(vo);

		if (result == 1 && vo.getFile().getSize() != 0) { // 글 작성에 성공하면 파일 업로드
			// 파일 객체 생성
			FileVO fileVO = new FileVO();
			fileVO.setArticle_no(vo.getNo());
			fileVO.setNo(1);
			fileVO.setFilename(vo.getFile().getOriginalFilename());
			String filename = fileVO.getSavedFilename();

			// DB에 파일 생성
			result = fileService.uploadFile(fileVO);
			if (result == 1) {// 서버에 파일 생성
				File file = new File(FileUtils.getUploadPath(request)+ filename);
				vo.getFile().transferTo(file);
			}
		}

		return String.valueOf(result);
	}
}
