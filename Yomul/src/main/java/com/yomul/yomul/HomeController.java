package com.yomul.yomul;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.LikeService;
import com.yomul.service.LikeServiceImpl;
import com.yomul.service.MemberService;
import com.yomul.service.ProductService;
import com.yomul.util.Commons;
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

	@RequestMapping(value = "product_write", method = RequestMethod.GET)
	public String product_write() {
		return "user/home/product_write";
	}

	@RequestMapping(value = "product_update", method = RequestMethod.GET)
	public String product_update() {
		return "user/home/product_update";
	}

	@RequestMapping(value = "product_info", method = RequestMethod.GET)
	public ModelAndView product_info(String no, HttpSession session) {
		ModelAndView mv = new ModelAndView("user/home/product_info");

		MemberVO member = (MemberVO) session.getAttribute("member");

		ProductVO product = productService.getProductInfo(no);

		MemberVO seller = new MemberVO();
		seller.setNo(product.getSeller());

		mv.addObject("product", product);
		mv.addObject("profileImg", memberService.getMyProfileImg(seller));

		LikeVO like = new LikeVO();
		like.setArticle_no(no);
		like.setMember_no(member.getNo());
		mv.addObject("isLiked", likeService.isLiked(like));

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
		String result = "";
		MemberVO member = (MemberVO) session.getAttribute("member");

		like.setMember_no(member.getNo());

		boolean isLiked = likeService.isLiked(like);
		if (isLiked) { // 좋아요를 눌렀으면 좋아요 취소
			result = String.valueOf(likeService.unLike(like));
		} else { // 좋아요를 누르지 않앗으면 좋아요
			result = String.valueOf(likeService.like(like));
		}
		return result;
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
