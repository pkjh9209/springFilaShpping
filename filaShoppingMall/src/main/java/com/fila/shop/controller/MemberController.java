package com.fila.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fila.shop.dto.MemberDTO;
import com.fila.shop.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	@Autowired
	SqlSession ss;
	
	@Autowired
	MemberService service;
	
//	회원가입 페이지이동
	@RequestMapping(value = "/insertMember")
	public String insertMember() throws Exception {
		
		return "member/memberInsert";
	}
//	회원가입
	@RequestMapping(value = "/insertMemberProc", method = RequestMethod.POST)
	public String insertMemberProc(MemberDTO md) throws Exception {
		System.out.println(md);
		service.insertMember(md);
		return "redirect:/";
	}
//  아이디 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck",method = RequestMethod.POST)
	public int idCheck(HttpServletRequest req) throws Exception {
		
		 String userId = req.getParameter("userId");
		 MemberDTO idCheck =  service.idCheck(userId);

		 int result = 0;

		 if(idCheck != null) {
			  result = 1;
			 } 

			 return result;
	}
//	로그인 페이지
	@RequestMapping(value = "/loginMember")
	public String loginMember() throws Exception {
		
		return "member/memberLogin";
	}
//	로그인
	@RequestMapping(value = "/loginMemberProc", method = RequestMethod.POST)
	public String loginMemberProc(MemberDTO md,HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = req.getSession();
		MemberDTO login = service.memberLogin(md);
		System.out.println(md);
		if(login == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg",false);
			System.out.println("널로오는가");
		}else{
			session.setAttribute("user", login);
			System.out.println("성공하는가");
		}
		
		return "redirect:/";
	}	
//	로그아웃
	@RequestMapping(value = "/logout")
	public String logoutMember(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
}
