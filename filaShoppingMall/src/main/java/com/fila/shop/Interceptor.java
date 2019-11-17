package com.fila.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fila.shop.dto.MemberDTO;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj)throws Exception{
		HttpSession session = req.getSession();
		  MemberDTO user = (MemberDTO)session.getAttribute("user");
		  
		  if(user == null) {
			  res.sendRedirect("/shop");
			  return false;
			 }
		  
		  if(user == null || user.getVerify() != 9) {
		   res.sendRedirect("/shop");
		   return false;
		  }
		  
		  return true;
		 
	}
	
}
