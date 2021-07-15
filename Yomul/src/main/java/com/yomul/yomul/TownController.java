package com.yomul.yomul;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yomul.dao.TownDAO;
import com.yomul.service.TownService;
import com.yomul.vo.FileVO;
import com.yomul.vo.TownVO;

@Controller
public class TownController {
	@Autowired
	private TownService townService;
	
	@RequestMapping(value = "/town_list", method = RequestMethod.GET)
	public String town_list() {
		return "user/town/town_list";
	}
	
	@RequestMapping(value = "/town_update", method = RequestMethod.GET)
	public String town_update() {
		return "user/town/town_update";
	}

	@RequestMapping(value = "/town_info", method = RequestMethod.GET)
	public String town_info() {
		return "user/town/town_info";
	}

	@RequestMapping(value = "/town_write", method = RequestMethod.GET)
	public String town_write() {
		return "user/town/town_write";
	}
	
	@RequestMapping(value = "/town_write_proc", method = RequestMethod.POST)
	public ModelAndView town_write_proc(TownVO town, FileVO file) {
		ModelAndView mv = new ModelAndView();
		System.out.println(town.toStringJson());
		town.setWriter(); //세션에서 회원번호 받아오기
		boolean result = townService.getTownWrite(town,file);
		
		if(result) {
			mv.setViewName("redirect:/town_list");
		}else {
			// mv.setViewName("error"); 에러페이지
		}
		return mv;
	}
	
	
}
