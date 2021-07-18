package com.yomul.yomul;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.FileService;
import com.yomul.service.VendorService;
import com.yomul.util.Commons;
import com.yomul.util.FileUtils;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ReviewVO;
import com.yomul.vo.VendorVO;

@Controller
public class VendorController {
	@Autowired
	private VendorService vendorService;
	@Autowired
	private FileService fileService;
	@Autowired
	private FileUtils fileUtils;
	
	//업체 등록
	@RequestMapping(value="/vendor_signup", method=RequestMethod.GET)
	public String vendor_signup() {
		return "user/near/vendor_signup";
	}
	
	// 업체 등록 처리
	@ResponseBody
	@RequestMapping(value="/vendor_signup_proc", method=RequestMethod.POST)
	public String vendor_signup_proc(VendorVO vo, MultipartFile file, HttpServletRequest request) {
		String result = "";
		FileVO fvo = null;
		
		String uno = "M3"; // 임시 테스트용
		vo.setOwner(uno);
//		HttpSession session = request.getSession();
//		vo.setNo((String)session.getAttribute("id"));
		
		// DB에 업체 정보 저장 / 반환 값은 저장된 업체 번호
		result = vendorService.vendorSignUp(vo);
		
		// 업체 등록에 성공하고 입력된 파일이 있을 경우 파일 저장 및 업로드
		if(!result.equals("0") && !file.isEmpty()) {
			fvo = new FileVO();
			fvo.setArticle_no(result);
			fvo.setNo(1);
			fvo.setFilename(fileUtils.genSaveFileName(file.getOriginalFilename()));
			
			fileUtils.uploadFile(fvo, file, request);
		}
		
		return String.valueOf(result);
	}
	
	//업체 프로필 보기
	@RequestMapping(value = "/vendor_profile_info/{no}", method = RequestMethod.GET)
	public ModelAndView vendor_profile_info(@PathVariable("no") String no) {
		ModelAndView mv = new ModelAndView("user/near/vendor_profile_info");
		
		// 업체 정보 조회
		VendorVO vo = vendorService.getVendorInfo(no);
		
		// 조회된 업체가 없을 경우 에러 페이지 이동
		if(vo == null) {
			mv.setViewName("redirect:/error");
		}
		
		mv.addObject("headerType", "profile");
		mv.addObject("no", no);
		mv.addObject("owner", vo.getOwner());
		mv.addObject("vo", vo);
		
		return mv;
	}
	
	//업체 프로필 수정
	@RequestMapping(value = "/vendor_profile_update", method = RequestMethod.GET)
	public ModelAndView vendor_profile_update(HttpSession session) {
		ModelAndView mv = new ModelAndView("user/near/vendor_profile_update");
		
		// 로그인한 계정 구하기
		MemberVO member = (MemberVO)session.getAttribute("member");
		String owner = member.getNo();
		
		// 업체 정보 조회
		VendorVO vo = vendorService.getVendorInfo(owner);
		
		// 조회된 업체가 없을 경우 에러 페이지 이동
		if(vo == null) {
			mv.setViewName("redirect:/error");
		}
		
		mv.addObject("headerType", "profile");
		mv.addObject("no", vo.getNo());
		mv.addObject("owner", vo.getOwner());
		mv.addObject("vo", vo);
		return mv;
	}
	
	// 업체 프로필 수정 처리
	@RequestMapping(value = "/vendor_profile_update_proc", method = RequestMethod.POST)
	public String vendor_profile_update_proc(HttpServletRequest request, VendorVO updateData, MultipartFile file) {
		
		// 로그인한 계정 구하기
		MemberVO member = (MemberVO)request.getSession().getAttribute("member");
		String owner = member.getNo();
		
		// 업체 정보 조회
		VendorVO vo = vendorService.getVendorInfo(owner);
		
		// 조회된 업체가 없을 경우 에러 페이지 이동
		if(vo == null) {
			return "redirect:/error";
		}
		
		// db에서 정보 업데이트
		updateData.setNo(vo.getNo());
		int result = vendorService.updateVendorInfo(updateData);
		
		// 수정된 결과가 없을 경우 에러 페이지 이동
		if(result == 0) {
			return "redirect:/error";
		}
		
		// 입력 받은 파일이 있을 경우 기존의 파일을 삭제하고 새 파일 저장
		if(!file.isEmpty()) {
			FileVO fvo = new FileVO();
			fvo.setArticle_no(vo.getNo());
			fvo.setNo(1);
			fvo.setFilename(fileUtils.genSaveFileName(file.getOriginalFilename()));
			
			fileService.deleteArticleFiles(vo.getNo());
			fileUtils.uploadFile(fvo, file, request);
		}
		
		// 수정에 성공했을 경우 프로필 페이지 이동
		return "redirect:vendor_profile_info/" + vo.getNo();
	}
	
	//업체 단골 목록
	@RequestMapping(value = "/vendor_profile_follow/{no}", method = RequestMethod.GET)
	public ModelAndView vendor_profile_follow(@PathVariable("no") String no) {
		ModelAndView mv = new ModelAndView("user/near/vendor_profile_follow");
		
		// 단골 목록 구하기(1페이지)
		ArrayList<MemberVO> list = vendorService.getVendorCustomerList(no, 1);
		
		// 업체 소유자 구하기
		String owner = vendorService.getVendorOwner(no);
		
		mv.addObject("headerType", "profile");
		mv.addObject("no", no);
		mv.addObject("owner", owner);
		mv.addObject("list", list);
		return mv;
	}
	
	// 업체 단골 목록 페이지네이션 ajax
	@ResponseBody
	@RequestMapping(value = "/vendor_profile_follow_pagination", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String vendor_profile_follow_pagination(String no, int page) {
		// 입력된 페이지의 단골 목록 구하기
		ArrayList<MemberVO> list = vendorService.getVendorCustomerList(no, page);
		
		// 결과를 json 형식으로 반환
		return Commons.parseJson(list);
	}
		
	//업체 소식 보기
	@RequestMapping(value = "/vendor_news_list/{no}", method = RequestMethod.GET)
	public ModelAndView vendor_news_list(@PathVariable("no") String no) {
		ModelAndView mv = new ModelAndView("user/near/vendor_news_list");
		
		
		
		mv.addObject("headerType", "news");
		mv.addObject("no", no);
		return mv;
	}
	
	//업체 소식 작성
	@RequestMapping(value = "/vendor_news_insert", method = RequestMethod.GET)
	public ModelAndView vendor_news_insert() {
		ModelAndView mv = new ModelAndView("user/near/vendor_news_insert");
		mv.addObject("headerType", "news");
		return mv;
	}
	
	//업체 소식 수정
	@RequestMapping(value = "/vendor_news_update", method = RequestMethod.GET)
	public ModelAndView vendor_news_update() {
		ModelAndView mv = new ModelAndView("user/near/vendor_news_update");
		mv.addObject("headerType", "news");
		return mv;
	}
	
	//업체 후기
	@RequestMapping(value = "/vendor_reviews/{no}", method = RequestMethod.GET)
	public ModelAndView vendor_reviews(@PathVariable("no") String no) {
		ModelAndView mv = new ModelAndView("user/near/vendor_reviews");
		
		// 업체 후기 목록 1페이지 조회
		ArrayList<ReviewVO> list = vendorService.getVendorReviewList(no, 1);
		
		// 주인 사용자 번호 조회
		String owner = vendorService.getVendorOwner(no);
		
		mv.addObject("no", no);
		mv.addObject("owner", owner);
		mv.addObject("list", list);
		return mv;
	}
	
	// 업체 후기 목록 페이지네이션 ajax
	@ResponseBody
	@RequestMapping(value = "/vendor_reviews_pagination", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String vendor_reviews_pagination(String no, int page) {
		// 입력된 페이지의 후기 목록 구하기
		ArrayList<ReviewVO> list = vendorService.getVendorReviewList(no, page);
		
		// 결과를 json 형식으로 반환
		return Commons.parseJson(list);
	}
}
