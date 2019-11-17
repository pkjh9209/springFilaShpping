package com.fila.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fila.shop.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired SqlSession ss;
//	회원가입
	public void insertMemeber(MemberDTO md) throws Exception{
		ss.insert("member.memberInsert",md);
	}
//  로그인
	public MemberDTO memberLogin(MemberDTO md) throws Exception{
		return ss.selectOne("member.memberLogin",md);
	}
//  아이디 체크 dao
	public MemberDTO idCheck(String userId) throws Exception{
		return ss.selectOne("member.idCheck",userId);
	}
}
