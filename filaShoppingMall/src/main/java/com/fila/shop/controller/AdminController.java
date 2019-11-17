package com.fila.shop.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	SqlSession ss;
	
//	관리자 페이지 화면
	@RequestMapping(value = "/index")
	public String insertMember() throws Exception {
		
		return "admin/index";
	}

}
