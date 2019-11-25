package com.fila.shop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fila.shop.dao.MallDAO;
import com.fila.shop.dto.CartDTO;
import com.fila.shop.dto.PdtCmtListDTO;
import com.fila.shop.dto.PdtCommentDTO;
import com.fila.shop.dto.PdtViewDTO;
import com.fila.shop.dto.ProductDTO;

@Service
public class MallService {
	
	@Autowired
	private MallDAO dao;
	
	//상품리스트 대분류
	public List<PdtViewDTO> list(int cateCodeRef) throws Exception{
		return dao.list(cateCodeRef);
	}
	//상품조회
	public ProductDTO mallView(int pdtCode) throws Exception{
		return dao.mallView(pdtCode);
	}
	//상품댓글
	public void insertCmt(PdtCommentDTO cd) throws Exception{
		dao.insertCmt(cd);
	}
	//댓글리스트
	public List<PdtCmtListDTO> pdtCmtList(int pdtNum) throws Exception{
		return dao.pdtCmtList(pdtNum);
	}
	//상품 댓글 삭제
	public void deleteCmt(PdtCommentDTO cd) throws Exception{
		dao.deleteCmt(cd);
	}
	//아이디 체크
	public String idCheck(int cmtPdtNum) throws Exception{
		return dao.idCheck(cmtPdtNum);
	}
	//카트담기
	public void insertCart(CartDTO td) throws Exception{
		dao.insertCart(td);
	}
}
