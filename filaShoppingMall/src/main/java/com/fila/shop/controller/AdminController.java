package com.fila.shop.controller;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fila.shop.dto.CategoryDTO;
import com.fila.shop.dto.ProductDTO;
import com.fila.shop.service.AdminService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	SqlSession ss;
	
	@Autowired
	AdminService adService;
	
//	관리자 페이지 화면
	@RequestMapping(value = "/index")
	public String adminMain() throws Exception {
		
		return "admin/index";
	}
	
//	상품등록 페이지
	@RequestMapping(value = "/pdtRegister",method = RequestMethod.GET)
	public String pdtRegister(Model model) throws Exception {
		List<CategoryDTO> category = null;
		category = adService.category();
		System.out.println(category);
		model.addAttribute("category",JSONArray.fromObject(category));
		return "admin/pdtRegister";
	}
	
//	상품등록
	@RequestMapping(value = "/pdtRegisterProc",method = RequestMethod.POST)
	public String pdtRegisterProc(ProductDTO pd) throws Exception {
		System.out.println("pd="+pd);
		adService.pdtRegister(pd);
		return "redirect:/admin/pdtRegister";
	}
	
//	상품리스트
	@RequestMapping(value = "/pdtList")
	public String pdtList(Model model) throws Exception {
		
		List<ProductDTO> list = adService.productList();
		model.addAttribute("list",list);
		return "admin/pdtList";
	}
	
// 	상품 조회
	@RequestMapping(value = "/pdtView", method = RequestMethod.GET)
	public String pdtView(@RequestParam("pdtNum") int pdtNum, Model model) throws Exception {
		
		ProductDTO viewPd = adService.pdtView(pdtNum);
		model.addAttribute("viewPd",viewPd);
		return "admin/pdtView";
	}
	
//	상품 수정 화면
	@RequestMapping(value = "/pdtUpdate",method = RequestMethod.GET)
	public String pdtUpdate(@RequestParam("pdtNum") int pdtNum, Model model) throws Exception {
		ProductDTO viewPd = adService.pdtView(pdtNum);
		model.addAttribute("viewPd",viewPd);
		
		List<CategoryDTO> category = null;
		category = adService.category();
		model.addAttribute("pdtSection",viewPd.getPdtSection());
		model.addAttribute("pdtSubCate",viewPd.getCateCode());
		model.addAttribute("category",JSONArray.fromObject(category));
		return "admin/pdtUpdate";
	}
//	상품수정
	@RequestMapping(value = "/pdtUpdateProc", method = RequestMethod.POST)
	public String postGoodsModify(ProductDTO pd) throws Exception {
		adService.pdtUpdate(pd);
		return "redirect:/admin/pdtList";
	}
	
//	상품 삭제
	@RequestMapping(value = "/pdtDelete")
	public String pdtDelete(@RequestParam("pdtNum") int pdtNum) throws Exception {
		adService.pdtDelete(pdtNum);
		return "redirect:/admin/pdtList";
	}	
}
