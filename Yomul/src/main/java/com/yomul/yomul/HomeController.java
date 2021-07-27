package com.yomul.yomul;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.ChatService;
import com.yomul.service.FavoriteService;
import com.yomul.service.FileService;
import com.yomul.service.LikeService;
import com.yomul.service.MemberService;
import com.yomul.service.ProductService;
import com.yomul.util.Commons;
import com.yomul.util.FileUtils;
import com.yomul.vo.CategoryVO;
import com.yomul.vo.ChatVO;
import com.yomul.vo.FavoriteVO;
import com.yomul.vo.FileVO;
import com.yomul.vo.LikeVO;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ProductVO;
import com.yomul.vo.TradeHistoryVO;

@Controller
public class HomeController {

	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private LikeService likeService;
	@Autowired
	private FileService fileService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private FileUtils fileUtils;

	// 글삭제
	@ResponseBody
	@RequestMapping(value = "/product_delete", method = RequestMethod.GET)
	public String product_delete(ProductVO pvo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		return String.valueOf(productService.getDelete(member, pvo));
	}

	// 글작성 열기
	@RequestMapping(value = "product_write", method = RequestMethod.GET)
	public ModelAndView product_write() {
		ModelAndView mv = new ModelAndView();

		ArrayList<CategoryVO> Pcategories = productService.getProductCategories(); // 파일업로드.? 데이터베이스 에서 카테고리 가져오는 sql 구문
																					// 작성

		// Select 카테고리 목록 from yomul_products
		// select no, content from yomul_faq_categories order by no asc
		// select no, content from YOMUL_PRODUCT_CATEGORIES order by no asc

		mv.setViewName("user/home/product_write");
		mv.addObject("categories", Pcategories);

		return mv;

	}// 사용자 q& 카테고리 작성 나눠져 있는거 참고

	/**
	 * 글작성 파일업로드
	 * 
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping(value = "product_write_proc", method = RequestMethod.POST)
	public ModelAndView product_write_proc(ProductVO pvo, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");

		pvo.setSeller(member.getNo());

		// 작성될 글 번호 가져오기 & 시퀸스 번호로 글 작성 진
		pvo.setNo(productService.getProductSequence());
		int result = productService.getProductWrite(pvo);

		if (result == 1 && pvo.getFilename().getSize() != 0) {// 글작성에 성공하면 파일 업로드
			// 파일객체 생성
			FileVO fileVO = new FileVO();
			fileVO.setArticle_no(pvo.getNo());
			fileVO.setNo(1);
			fileVO.setFilename(pvo.getFilename().getOriginalFilename());
			String filename = fileVO.getSavedFilename();

			// DB에 파일 생성
			result = fileService.uploadFile(fileVO);
			if (result == 1) {// 서버에 파일생성
				mv.setViewName("redirect:product_list");// 작성한 게시물 몇번인지 알아야 info일 경
				File file = new File(FileUtils.getUploadPath(request), filename);
				pvo.getFilename().transferTo(file);
			}

		}

		return mv;
	}

	/**
	 * 물품 수정 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "product_update", method = RequestMethod.GET)
	public ModelAndView product_update(String no) {
		ModelAndView mv = new ModelAndView("user/home/product_update");

		ArrayList<CategoryVO> Pcategories = productService.getProductCategories();

		ProductVO product = productService.getProductInfo(no);

		mv.addObject("categories", Pcategories);
		mv.addObject("product", product);
		mv.addObject("productImgList", productService.getProductImg(product));

		return mv;
	}

	/**
	 * 물품 수정 처리
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "product_update_proc", method = RequestMethod.POST)
	public ModelAndView product_update_proc(ProductVO pvo, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:product_list");

		// 물품 내용 수정
		int result = productService.updateProduct(pvo);

		if (result == 1 && pvo.getFilename().getSize() != 0) { // 파일이 입력된 경우 실행
			// 기존 파일 삭제
			ArrayList<FileVO> fList = fileService.getFileList(pvo.getNo());
			FileVO oldFile = fList.get(0);

			File file = new File(FileUtils.getUploadPath(session),  oldFile.getSavedFilename());
			if (file.exists()) {
				file.delete();
			}

			// 새로운 파일 업로드
			FileVO newFile = new FileVO();
			newFile.setArticle_no(pvo.getNo());
			newFile.setNo(1);
			newFile.setFilename(pvo.getFilename().getOriginalFilename());

			result = fileUtils.uploadFile(newFile, pvo.getFilename(), request);
		}

		return mv;
	}

	/**
	 * 물품 정보보기
	 * 
	 * @param no
	 * @return
	 */
	@RequestMapping(value = "product_info", method = RequestMethod.GET)
	public ModelAndView product_info(String no, HttpSession session) {
		ModelAndView mv = new ModelAndView("user/home/product_info");
		MemberVO member = (MemberVO) session.getAttribute("member");

		ProductVO product = productService.getProductInfo(no);

		MemberVO seller = new MemberVO();
		seller.setNo(product.getSeller());

		if (member != null) {
			LikeVO like = new LikeVO();
			like.setArticle_no(no);
			like.setMember_no(member.getNo());
			mv.addObject("isLiked", likeService.isLiked(like));

			FavoriteVO favorite = new FavoriteVO();
			favorite.setMember_no(member.getNo());
			favorite.setProduct_no(no);
			mv.addObject("isFavorite", favoriteService.isFavorite(favorite) == 1 ? true : false);
		}

		mv.addObject("product", product);
		mv.addObject("productImgList", productService.getProductImg(product));
		mv.addObject("profileImg", memberService.getMyProfileImg(seller));
		mv.addObject("likeCount", likeService.getLikeCount(no));
		mv.addObject("favoriteCount", favoriteService.getFavoriteCount(no));

		return mv;
	}

	/**
	 * 물건 판매 처리
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/sell_product", method = RequestMethod.POST)
	public String sell_product(TradeHistoryVO vo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member == null) {
			return "0";
		}
		return String.valueOf(productService.sellProduct(vo));
	}

	/**
	 * 좋아요 처리
	 * 
	 * @param like
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "product_like", method = RequestMethod.GET)
	public String product_like(LikeVO like, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");

		like.setMember_no(member.getNo());

		boolean isLiked = likeService.isLiked(like);
		int val;
		if (isLiked) { // 좋아요를 눌렀으면 좋아요 취소
			val = likeService.unLike(like);
			return val == 1 ? "2" : "0";
		} else { // 좋아요를 누르지 않앗으면 좋아요
			val = likeService.like(like);
			return val == 1 ? "3" : "0";
		}
	}

	/**
	 * 찜 처리
	 * 
	 * @param like
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "product_favorite", method = RequestMethod.GET)
	public String product_favorite(FavoriteVO vo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");

		vo.setMember_no(member.getNo());

		int isLiked = favoriteService.isFavorite(vo);
		int val;
		if (isLiked == 1) { // 찜을 눌렀으면 좋아요 취소
			val = favoriteService.unFavorite(vo);
			return val == 1 ? "2" : "0";
		} else { // 찜을 누르지 않앗으면 좋아요
			val = favoriteService.favorite(vo);
			return val == 1 ? "3" : "0";
		}
	}

	/**
	 * 채팅 처리
	 * 
	 * @param like
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "product_chat", method = RequestMethod.GET)
	public String product_chat(ChatVO vo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");

		vo.setChat_from(member.getNo());

		int result = chatService.chat(vo);

		return String.valueOf(result);
	}

	/**
	 * 물품 목록 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/product_list", method = RequestMethod.GET)
	public ModelAndView product_list(String search) {
		ModelAndView mv = new ModelAndView("user/home/product_list");
		mv.addObject("search", search);
		return mv;
	}

	/**
	 * 물품 목록 불러오기 AJAX
	 * 
	 * @param page
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/product_list_ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String product_list_ajax(ProductVO product, String page, String search) {
		return Commons.parseJson(productService.getProductList(product, page, search));
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "user/home/product_list";
	}

}
