package com.yomul.yomul;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yomul.dao.NearDAO;
import com.yomul.service.CommentService;
import com.yomul.service.NearService;
import com.yomul.util.FileUtils;
import com.yomul.vo.CommentVO;
import com.yomul.vo.NearVO;

@Controller
public class NearController {

	@Autowired
	private NearService nearService;
	
	@Autowired
	private CommentService	commentService;
	
	@Autowired
	private NearDAO nearDAO;

	@Autowired
	private FileUtils fileUploadService;

	@RequestMapping(value = "/near_home", method = RequestMethod.GET)
	public ModelAndView near_home() {
		ModelAndView mv = new ModelAndView();

		String keyword[] = { "부동산", "카페", "요가", "휴대폰", "마사지", "미용실", "왁싱" };

		mv.setViewName("user/near/near_home");
		mv.addObject("keyword", keyword);

		return mv;
	}

	// 내 근처 글 쓰기 (동네구인구직, 과외/클래스, 농수산물, 중고차)
	@RequestMapping(value = "/near_write", method = RequestMethod.GET)
	public String near_write() {
		return "user/near/near_write";
	}

	@RequestMapping(value = "/near_write_proc", method = RequestMethod.POST)
	public ModelAndView near_write_proc(NearVO vo, @RequestParam("uploadFile") List<MultipartFile> files, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();
		int fileCount = fileUploadService.getUploadedCount(files);
		String url = fileUploadService.restore(files, nearDAO, request);
		mv.addObject("url", url);
		mv.addObject("fileCount", fileCount);
		int result = nearDAO.getNearWrite(vo);

		if (result == 1) {

			mv.setViewName("redirect:/near_home");

		} else {
			// mv.setViewName("error"); 에러페이지
		}

		return mv;
	}

	@RequestMapping(value = "/near_update", method = RequestMethod.GET)
	public String near_update() {
		return "user/near/near_update";
	}

	// 내 근처 상세보기
	@RequestMapping(value = "/near_info/{no}", method = RequestMethod.GET)
	public ModelAndView near_info(@PathVariable("no") int no) {
		ModelAndView mv = new ModelAndView();

		// 조회수 갱신 겸 게시글 유무 확인
		if (nearService.updateNearHits(no)) {
			NearVO vo = nearService.getNearInfo(no);
			ArrayList<CommentVO> comments = commentService.getCommentList("N" + no, 1);
			int commentCount = commentService.getCommentCount("N" + no);
			
			mv.setViewName("user/near/near_info");
			mv.addObject("comments", comments);
			mv.addObject("commentCount", commentCount);
			mv.addObject("vo", vo);
		} else { // 게시글이 없을 경우 에러페이지 이동
			mv.setViewName("redirect:/user/error");
		}
		
		return mv;
	}
	
	// 댓글 페이지 이동
	@ResponseBody
	@RequestMapping(value = "/near_info/comments", method = RequestMethod.GET, produces = "text/plain; charset=utf8")
	public String near_info_comment(int no, int page) {
		Gson gson = new GsonBuilder().create();
		ArrayList<CommentVO> comments = commentService.getCommentList("N" + no, page);
		
		for(CommentVO vo : comments) {
			System.out.println(vo.toStringJson());
		}
		
		return gson.toJson(comments);
	}

	@RequestMapping(value = "/near_news_form", method = RequestMethod.GET)
	public String near_news_form() {
		return "user/near/near_news_form";
	}

	@RequestMapping(value = "/near_card_form", method = RequestMethod.GET)
	public String near_card_form() {
		return "user/near/near_card_form";
	}

	@RequestMapping(value = "/reviews_info", method = RequestMethod.GET)
	public String reviews_info() {
		return "user/near/reviews_info";
	}

}
