package com.fila.shop.controller;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fila.shop.dto.CategoryDTO;
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
	public String insertMember() throws Exception {
		
		return "admin/index";
	}
//	상품등록
	@RequestMapping(value = "/pdtRegister",method = RequestMethod.GET)
	public String pdtRegister(Model model) throws Exception {
		List<CategoryDTO> category = null;
		category = adService.category();
		System.out.println(category);
		model.addAttribute("category",JSONArray.fromObject(category));
		return "admin/pdtRegister";
	}
}
