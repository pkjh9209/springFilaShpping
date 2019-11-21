package com.fila.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fila.shop.dto.CategoryDTO;
import com.fila.shop.dto.PdtViewDTO;
import com.fila.shop.dto.ProductDTO;
@Repository
public class AdminDAO {
	
	@Autowired SqlSession ss;
//	카테고리
	public List<CategoryDTO> category() throws Exception{
		return ss.selectList("admin.category");
	}
//  상품등록	
	public void pdtRegister(ProductDTO pd) throws Exception{
		ss.insert("admin.pdtRegister",pd);
	}
//  상품목록	
	public List<ProductDTO> productList() throws Exception{
		return ss.selectList("admin.pdtList");
	}
//  상품조회	
	public ProductDTO pdtView(int pdtNum) throws Exception{
		return ss.selectOne("admin.pdtView",pdtNum);
	}
//	상품수정
	public void pdtUpdate(ProductDTO pd) throws Exception{
		ss.update("admin.pdtUpdate",pd);
	}
//  상품삭제
	public void pdtDelete(int pdtNum) throws Exception{
		ss.delete("admin.pdtDelete",pdtNum);
	}
//  상품조회 및 카테고리
	public PdtViewDTO pdtJoinView(int pdtNum) throws Exception{
		return ss.selectOne("admin.pdtJoinView",pdtNum);
	}
}
