package com.fila.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fila.shop.dao.AdminDAO;
import com.fila.shop.dto.CategoryDTO;
import com.fila.shop.dto.ProductDTO;

@Service
public class AdminService{
	
	@Autowired
	private AdminDAO dao;
	// 카테고리	
	public List<CategoryDTO> category() throws Exception{
		return dao.category();
	}
	// 상품등록
	public void pdtRegister(ProductDTO pd) throws Exception{
		dao.pdtRegister(pd);
	}
	// 상품목록
	public List<ProductDTO> productList() throws Exception{
		return dao.productList();
	}
	// 상품조회
	public ProductDTO pdtView(int pdtNum) throws Exception{
		return dao.pdtView(pdtNum);
	}
	// 상품수정
	public void pdtUpdate(ProductDTO pd) throws Exception{
		dao.pdtUpdate(pd);
	}
	// 상품삭제
	public void pdtDelete(int pdtNum) throws Exception{
		dao.pdtDelete(pdtNum);
	}
}
