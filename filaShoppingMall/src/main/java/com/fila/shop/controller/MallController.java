package com.fila.shop.controller;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fila.shop.dto.PdtViewDTO;
import com.fila.shop.dto.ProductDTO;
import com.fila.shop.service.MallService;

@Controller
@RequestMapping(value = "/mall")
public class MallController {
	@Autowired
	SqlSession ss;
	@Autowired
	MallService mlService;

//	샵 페이지 화면
	@RequestMapping(value = "/mallList",method = RequestMethod.GET)
	public String mallList(@RequestParam("ref") int cateCodeRef,Model model) throws Exception {
		
		List<PdtViewDTO> list = null;
		list = mlService.list(cateCodeRef);
		int categoryPage = cateCodeRef;
		
		model.addAttribute("categoryPage",categoryPage);
		model.addAttribute("list", list);
		return "mall/mallList";
	}
//  상품 페이지 조회
	@RequestMapping(value = "/mallView", method = RequestMethod.GET)
	public String pdtView(@RequestParam("pdtCode") int pdtCode, Model model) throws Exception {

		ProductDTO viewPd = mlService.mallView(pdtCode);
		model.addAttribute("viewPd", viewPd);
		return "mall/mallView";
	}
	
}
