package com.yomul.yomul;

import java.util.ArrayList;
import java.util.HashMap;

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

import com.yomul.service.CommentService;
import com.yomul.service.FileService;
import com.yomul.service.NearService;
import com.yomul.service.VendorService;
import com.yomul.util.Commons;
import com.yomul.util.FileUtils;
import com.yomul.vo.CommentVO;
import com.yomul.vo.FileVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.NearVO;
import com.yomul.vo.ReviewVO;
import com.yomul.vo.VendorVO;

@Controller
public class VendorController {
	@Autowired
	private VendorService vendorService;
	@Autowired
	private NearService nearService;
	@Autowired
	private CommentService commentService;
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
		
		// 로그인한 회원 정보 구하기
		MemberVO member = (MemberVO) request.getSession().getAttribute("member");
		
		// 로그인되어 있지 않을 경우 등록 실패
		if(member == null) {
			return "0";
		}
		String uno = member.getNo();
		vo.setOwner(uno);
		
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
	
	//업체 탈퇴 신청 페이지
	@RequestMapping(value="/vendor_withdrawal", method=RequestMethod.GET)
	public String vendor_withdrawal(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 로그인 필요
		if(member == null) {
			return "redirect:/login";
		}
		
		return "user/near/vendor_withdrawal";
	}
	
	// 업체 탈퇴 신청 처리
	@ResponseBody
	@RequestMapping(value="/vendor_withdrawal_proc", method=RequestMethod.GET)
	public String vendor_withdrawal_proc(HttpSession session) {
		int result = 0;
		
		// 로그인한 회원 정보 구하기
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 로그인되어 있지 않을 경우 -1 반환
		if(member == null) {
			return "-1";
		}
		
		// 업체 회원이 아닐 경우 -2 반환
		String uno = member.getNo();
		if(!vendorService.isVendor(uno)) {
			return "-2";
		}
		
		// 해당 회원 번호의 업체 탈퇴 신청 / 1일 경우 성공, 0일 경우(이미 탈퇴 신청한 경우) 실패
		result = vendorService.withdrawalVendor(uno);
		
		return String.valueOf(result);
	}
	
	//업체 탈퇴 신청 취소 페이지
	@RequestMapping(value="/vendor_withdrawal_cancel", method=RequestMethod.GET)
	public String vendor_withdrawal_cancel(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 로그인 필요
		if(member == null) {
			return "redirect:/login";
		}
		
		return "user/near/vendor_withdrawal_cancel";
	}
	
	// 업체 탈퇴 신청 취소 처리
	@ResponseBody
	@RequestMapping(value="/vendor_withdrawal_cancel_proc", method=RequestMethod.GET)
	public String vendor_withdrawal_cancel_proc(HttpSession session) {
		int result = 0;
		
		// 로그인한 회원 정보 구하기
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 로그인되어 있지 않을 경우 -1 반환
		if(member == null) {
			return "-1";
		}
		
		// 업체 번호 구하기
		String uno = member.getNo();
		
		// 해당 회원 번호의 업체 탈퇴 신청 / 1일 경우 성공, 0일 경우 실패
		result = vendorService.cancelWithdrawalVendor(uno);
		
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
		
	//업체 소식 목록
	@RequestMapping(value = "/vendor_news_list/{no}", method = RequestMethod.GET)
	public ModelAndView vendor_news_list(@PathVariable("no") String no) {
		ModelAndView mv = new ModelAndView("user/near/vendor_news_list");
		
		// 업체 소식 목록 조회
		ArrayList<NearVO> list = vendorService.getVendorNewsList(no, 1);
		
		// 업체 소유자 구하기
		String owner = vendorService.getVendorOwner(no);
		
		mv.addObject("headerType", "news");
		mv.addObject("no", no);
		mv.addObject("owner", owner);
		mv.addObject("list", list);
		return mv;
	}
	
	// 업체 소식 목록 페이지네이션 ajax
	@ResponseBody
	@RequestMapping(value = "/vendor_news_pagination", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String vendor_news_pagination(String no, int page) {
		// 입력된 페이지의 단골 목록 구하기
		ArrayList<NearVO> list = vendorService.getVendorNewsList(no, page);
		
		// 결과를 json 형식으로 반환
		return Commons.parseJson(list);
	}
	
	//업체 소식 작성
	@RequestMapping(value = "/vendor_news_write", method = RequestMethod.GET)
	public ModelAndView vendor_news_write(HttpSession session) {
		ModelAndView mv = new ModelAndView("user/near/vendor_news_write");
		
		// 로그인한 업체 정보 구하기
		MemberVO member = (MemberVO) session.getAttribute("member");
		String uno = member.getNo();
		String vno = vendorService.getVendorNo(uno); // 업체 번호
		String owner = vendorService.getVendorOwner(vno); // 업체 주인 번호
		
		// 업체 회원이 아닐 경우 에러페이지 이동
		if(vno.equals("")) {
			mv.setViewName("redirect:/error");
			return mv;
		}
		
		mv.addObject("headerType", "news");
		mv.addObject("no", vno);
		mv.addObject("owner", owner);
		return mv;
	}
	
	//업체 소식 작성
	@ResponseBody
	@RequestMapping(value="/vendor_news_write_proc", method=RequestMethod.POST)
	public String vendor_news_write_proc(NearVO vo, ArrayList<MultipartFile> filelist, HttpServletRequest request) {
		String result = "";
		
		// 로그인한 회원 정보 구하기
		MemberVO member = (MemberVO) request.getSession().getAttribute("member");
		
		// 로그인되어 있지 않을 경우 등록 실패
		if(member == null) {
			return "0";
		}
		String uno = member.getNo();
		
		// 업체 정보
		VendorVO vendor = vendorService.getVendorInfo(uno);
		
		// 업체 정보 입력
		vo.setWriter(uno);
		vo.setVno(vendor.getNo());
		vo.setCategory(vendor.getCategory());
		vo.setHp(vendor.getTel());
		
		// DB에 업체 정보 저장
		result = nearService.insertVendorNews(vo);
		
		// db 저장에 실패한 경우 0 반환
		if(result.equals("0")) {
			return result;
		}
		
		// 입력된 파일이 있을 경우 파일 저장 및 업로드
		if(!filelist.isEmpty()) {
			fileUtils.restore(result, filelist, request);
		}
		
		// 성공할 경우 게시글 번호 반환
		return result;
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

	// 업체 후기 상세보기
	@RequestMapping(value = "/reviews_info/{no}", method = RequestMethod.GET)
	public ModelAndView reviews_info(@PathVariable("no") String no) {
		ModelAndView mv = new ModelAndView("user/near/reviews_info");
		
		// 조회수 추가 겸 해당 후기 존재여부 확인
		if(vendorService.updateVendorReviewHits(no) == 0) {
			// 해당 후기가 없을 경우 에러 페이지 이동
			mv.setViewName("/error");
			return mv;
		}
		
		// 해당 번호의 후기 불러오기
		ReviewVO vo = vendorService.getVendorReviewInfo(no);
		
		// 댓글 조회
		int commentCount = commentService.getCommentCount(no);
		ArrayList<CommentVO> comments = commentService.getCommentList(no, 1);
		
		// 댓글 페이지 정보 불러오기
		HashMap<String, Integer> commentPageInfo = Commons.getPageInfo(commentCount, 10);
		
		mv.addObject("vo", vo);
		mv.addObject("comments", comments);
		mv.addObject("commentPageInfo", commentPageInfo);
		return mv;
	}
}
