package com.fila.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fila.shop.dao.AdminDAO;
import com.fila.shop.dto.CategoryDTO;
import com.fila.shop.dto.OrderDTO;
import com.fila.shop.dto.OrderListDTO;
import com.fila.shop.dto.PdtCmtListDTO;
import com.fila.shop.dto.PdtViewDTO;
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
	// 상품조회 및 카테고리
	public PdtViewDTO pdtJoinView(int pdtNum) throws Exception{
		return dao.pdtJoinView(pdtNum);
	}
	//	주문목록 전체보기
	public List<OrderDTO> orderList() throws Exception{
		return dao.orderList();
	}
	// 특정 주문 목록
	public List<OrderListDTO> orderListView(OrderDTO od) throws Exception{
		return dao.orderListView(od);
	}
	//  배송상태
	public void deliveryStatus(OrderDTO od) throws Exception{
		dao.deliveryStatus(od);
	}
	// 상품 수량 조절
	public void changeStock(ProductDTO pd) throws Exception{
		dao.changeStock(pd);
	}
	//	모든 상품평 조회
	public List<PdtCmtListDTO> cmtAll() throws Exception{
		return dao.cmtAll();
	}
	//  상품평 삭제
	public void adDeleteCmt(int cmtPdtNum) throws Exception{
		dao.adDeleteCmt(cmtPdtNum);
	}
}
