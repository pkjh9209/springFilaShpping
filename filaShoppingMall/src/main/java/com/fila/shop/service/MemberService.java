package com.fila.shop.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fila.shop.dao.MemberDAO;
import com.fila.shop.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
//	회원가입
	public void insertMember(MemberDTO md) throws Exception{
		dao.insertMemeber(md);
	}
//  로그인
	public MemberDTO memberLogin(MemberDTO md) throws Exception{
		return dao.memberLogin(md);
	}
//	로그아웃
	public void memberLogout(HttpSession session) throws Exception{
		session.invalidate();
	}
//  아이디체크
	public MemberDTO idCheck(String userId) throws Exception{
		return dao.idCheck(userId);
	}
}
