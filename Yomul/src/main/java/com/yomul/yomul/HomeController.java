package com.yomul.yomul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.MemberService;
import com.yomul.service.ProductService;
import com.yomul.util.Commons;
import com.yomul.vo.MemberVO;
import com.yomul.vo.ProductVO;

@Controller
public class HomeController {

	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "product_write", method = RequestMethod.GET)
	public String product_write() {
		return "user/home/product_write";
	}

	@RequestMapping(value = "product_update", method = RequestMethod.GET)
	public String product_update() {
		return "user/home/product_update";
	}

	@RequestMapping(value = "product_info", method = RequestMethod.GET)
	public ModelAndView product_info(String no) {
		ModelAndView mv = new ModelAndView("user/home/product_info");
		ProductVO product = productService.getProductInfo(no);
		MemberVO member = new MemberVO();
		member.setNo(product.getSeller());
		mv.addObject("product", product);
		mv.addObject("profileImg", memberService.getMyProfileImg(member));
		return mv;
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
