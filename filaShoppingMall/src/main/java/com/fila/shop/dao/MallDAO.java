package com.fila.shop.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fila.shop.dto.CartDTO;
import com.fila.shop.dto.CartListDTO;
import com.fila.shop.dto.PdtCmtListDTO;
import com.fila.shop.dto.PdtCommentDTO;
import com.fila.shop.dto.PdtViewDTO;
import com.fila.shop.dto.ProductDTO;

@Repository
public class MallDAO {
	
	@Autowired SqlSession ss;
	
	//상품리스트 대분류
	public List<PdtViewDTO> list(int cateCodeRef) throws Exception{
		return ss.selectList("mall.mallList",cateCodeRef);
	}
	//상품조회
	public ProductDTO mallView(int pdtCode) throws Exception{
		return ss.selectOne("admin.pdtView",pdtCode);
	}
	//상품댓글
	public void insertCmt(PdtCommentDTO cd) throws Exception{
		ss.insert("mall.insertCmt",cd);
	}
	//댓글리스트
	public List<PdtCmtListDTO> pdtCmtList(int pdtNum) throws Exception{
		return ss.selectList("mall.PdtlistCmt",pdtNum);
	}
	//상품 댓글 삭제
	public void deleteCmt(PdtCommentDTO cd) throws Exception{
		ss.delete("mall.deleteCmt",cd);
	}
	//아이디 체크
	public String idCheck(int cmtPdtNum) throws Exception{
		return ss.selectOne("mall.pdtCmtIdCheck",cmtPdtNum);
	}
	//카트담기
	public void insertCart(CartDTO td) throws Exception{
		ss.insert("mall.insertCart",td);
	}
	// 카트 리스트
	public List<CartListDTO> cartList(String userId)throws Exception{
		return ss.selectList("mall.listCart",userId);
	}
	//카트삭제
	public void deleteCart(CartDTO td) throws Exception{
		ss.delete("mall.deleteCart",td);
	}
}
