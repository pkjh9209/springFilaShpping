package com.fila.shop.controller;


import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
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
import com.fila.shop.dto.CartListDTO;
import com.fila.shop.dto.MemberDTO;
import com.fila.shop.dto.OrderDTO;
import com.fila.shop.dto.OrderDetailDTO;
import com.fila.shop.dto.OrderListDTO;
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
	public String mallList(@RequestParam("ref") int cateCodeRef,@RequestParam("level") int level,Model model) throws Exception {
		
		List<PdtViewDTO> list = null;
		List<PdtViewDTO> subNav = null;
		list = mlService.list(cateCodeRef);
		subNav = mlService.listSub(level);
	
		
		model.addAttribute("list", list);
		model.addAttribute("subNav", subNav);
		//타이틀 
		if(cateCodeRef == 1) {
			model.addAttribute("tt", "OUTER");
		}else if(cateCodeRef == 2) {
			model.addAttribute("tt", "TOP");
		}else if(cateCodeRef == 3) {
			model.addAttribute("tt", "BOTTOM");
		}else if(cateCodeRef == 4) {
			model.addAttribute("tt", "ACC");
		}
		
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
	@RequestMapping(value = "/mallView/insertCart", method = RequestMethod.POST)
	public int insertCart(CartDTO td, HttpSession session) throws Exception {
	 
		int result = 0;	
		
		MemberDTO user = (MemberDTO)session.getAttribute("user");
		System.out.println(user);
		if(user != null) {
			td.setUserId(user.getUserId());
			mlService.insertCart(td);
			result = 1;
		}
	
		return result;
	}
// 카트 목록
	@RequestMapping(value = "/mallCartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
	 
		MemberDTO user = (MemberDTO)session.getAttribute("user");
		String userId = user.getUserId();
	 
		List<CartListDTO> cartList = mlService.cartList(userId);
	 
		model.addAttribute("cartList", cartList);
	}
// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartDTO td) throws Exception {
	 
		MemberDTO user = (MemberDTO)session.getAttribute("user");
		String userId = user.getUserId();
	 
	 	int result = 0;
 		int cartNum = 0;
	 
	 
		if(user != null) {
		td.setUserId(userId);
		  
		for(String i : chArr) {   
			cartNum = Integer.parseInt(i);
			td.setCartNum(cartNum);
			mlService.deleteCart(td);
		}   
			result = 1;
		}
		
		return result;  
	}
// 주문 목록
	@RequestMapping(value = "/mallCartList", method = RequestMethod.POST)
	public String orderInfo(HttpSession session, OrderDTO od, OrderDetailDTO otd) throws Exception {
		MemberDTO user = (MemberDTO)session.getAttribute("user");
		String userId = user.getUserId();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		 
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		 
		String orderId = ymd + "_" + subNum;
		 
		od.setOrderId(orderId);
		od.setUserId(userId);
		  
		mlService.orderInfo(od);
		 
		otd.setOrderId(orderId);   
		mlService.orderInfoDetail(otd);
		
		mlService.deleteAllCart(userId);
		 
		return "redirect:mallOrderList";
	}
	// 주문 목록
	@RequestMapping(value = "/mallOrderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderDTO od, Model model) throws Exception {
	 
		MemberDTO user = (MemberDTO)session.getAttribute("user");
		String userId = user.getUserId();
		 
		od.setUserId(userId);
		 
		List<OrderDTO> orderList = mlService.orderList(od);
		model.addAttribute("orderList", orderList);
	}
	
	// 주문 상세 목록
	@RequestMapping(value = "/mallOrderListView", method = RequestMethod.GET)
	public void orderListView(HttpSession session,
	      @RequestParam("orderCode") String orderId, OrderDTO od, Model model) throws Exception {
		MemberDTO user = (MemberDTO)session.getAttribute("user");
		String userId = user.getUserId();
		od.setUserId(userId);
		od.setOrderId(orderId);
		 
		List<OrderListDTO> orderView = mlService.orderViewList(od);
		 System.out.println("orderView = "+orderView);
		model.addAttribute("orderView", orderView);
		
	}
}
