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
		 *  글작성 파일업로드
		 * @return
		 * @throws IOException
		 * @throws IllegalStateException
		 */
		@RequestMapping(value = "product_write_proc", method = RequestMethod.POST) 
		public ModelAndView product_write_proc(ProductVO pvo,  HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException{
			ModelAndView mv = new ModelAndView();
			MemberVO member = (MemberVO) session.getAttribute("member");

			pvo.setSeller(member.getNo());
			
			//작성될 글 번호 가져오기 & 시퀸스 번호로 글 작성 진
			pvo.setNo(productService.getProductSequence());
			int result = productService.getProductWrite(pvo);
			
			if (result == 1 && pvo.getFile().getSize() != 0) {// 글작성에 성공하면 파일 업로드
				// 파일객체 생성
				FileVO fileVO = new FileVO();
				fileVO.setArticle_no(pvo.getNo());
				fileVO.setNo(1);
				fileVO.setFilename(pvo.getFile().getOriginalFilename());
				String filename = fileVO.getSavedFilename();

				// DB에 파일 생성
				result = fileService.uploadFile(fileVO);
					if (result == 1) {// 서버에 파일생성
						mv.setViewName("redirect:product_list");// 작성한 게시물 몇번인지 알아야 info일 경
						File file = new File(FileUtils.getUploadPath(request), filename);
						pvo.getFile().transferTo(file);
					}
					
			}

			return mv;
		}
		
		
		
	@RequestMapping(value = "product_update", method = RequestMethod.GET)
	public String product_update() {
		return "user/home/product_update";
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
		mv.addObject("profileImg", memberService.getMyProfileImg(seller));
		mv.addObject("likeCount", likeService.getLikeCount(no));
		mv.addObject("favoriteCount", favoriteService.getFavoriteCount(no));

		return mv;
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
	public ModelAndView product_list() {
		ModelAndView mv = new ModelAndView("user/home/product_list");
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
	public String product_list_ajax(ProductVO product, String page) {
		return Commons.parseJson(productService.getProductList(product, page));
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "user/home/product_list";
	}

}
