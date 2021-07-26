package com.yomul.yomul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.service.NearService;
import com.yomul.service.ProductService;

@Controller
public class UserController {

	@Autowired
	private ProductService productService;
	@Autowired
	private NearService nearService;

	/**
	 * 통합 검색
	 * 
	 * @param target
	 * @return
	 */
	@RequestMapping(value = "total_search", method = RequestMethod.GET)
	public ModelAndView total_search(String target) {
		ModelAndView mv = new ModelAndView("user/total_search");

		mv.addObject("target", target);
		mv.addObject("productList", productService.getProductList(null, "1", target));
		mv.addObject("nearList", nearService.selectNearCardList(null, target));
		return mv;
	}

	@RequestMapping(value = "/usepolicy", method = RequestMethod.GET)
	public ModelAndView usepolicy() {
		ModelAndView mv = new ModelAndView("user/usepolicy");
		return mv;
	}

	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public ModelAndView privacy() {
		ModelAndView mv = new ModelAndView("user/privacy");
		return mv;
	}
}
