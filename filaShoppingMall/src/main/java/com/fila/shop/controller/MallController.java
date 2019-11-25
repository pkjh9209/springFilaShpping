package com.fila.shop.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fila.shop.dto.CartDTO;
import com.fila.shop.dto.MemberDTO;
import com.fila.shop.dto.PdtCmtListDTO;
import com.fila.shop.dto.PdtCommentDTO;
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

//  상품 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "/mallView/insertCmt", method = RequestMethod.POST)
	public void insertCmt(PdtCommentDTO pdtCmt,HttpSession session) throws Exception {
	 
		MemberDTO md = (MemberDTO)session.getAttribute("user");
		pdtCmt.setUserId(md.getUserId());
		
		mlService.insertCmt(pdtCmt);
	} 
//  상품 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "/mallView/pdtCmtList", method = RequestMethod.GET)
	public List<PdtCmtListDTO> getPdtCmtList(@RequestParam("pdtCode") int pdtCode) throws Exception {
	   
	 List<PdtCmtListDTO> comment = mlService.pdtCmtList(pdtCode);
	 
	 return comment;
	}
//  상품 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/mallView/deletePdtCmt", method = RequestMethod.POST)
	public int deletePdtCmt(PdtCommentDTO cd,HttpSession session) throws Exception {
	   int result = 0;

	   MemberDTO user = (MemberDTO)session.getAttribute("user");
	   String userId = mlService.idCheck(cd.getCmtPdtNum());
	   if(user.getUserId().equals(userId)) {
		   cd.setUserId(user.getUserId());
		   mlService.deleteCmt(cd);
		   result = 1;
	   }
	 return result;
	}
// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/insertCart", method = RequestMethod.POST)
	public int insertCart(CartDTO td, HttpSession session) throws Exception {
	 
	int result = 0;	
	
	MemberDTO user = (MemberDTO)session.getAttribute("user");
	if(user != null) {
		user.setUserId(user.getUserId());
		mlService.insertCart(td);
		result = 1;
	}

	return result;

	 
	}
}
