package com.fila.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fila.shop.dto.CategoryDTO;
import com.fila.shop.dto.OrderDTO;
import com.fila.shop.dto.OrderListDTO;
import com.fila.shop.dto.PdtCmtListDTO;
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
	//	주문목록 전체보기
	public List<OrderDTO> orderList() throws Exception{
		return ss.selectList("admin.orderList");
	}
	//  특정 주문 목록
	public List<OrderListDTO> orderListView(OrderDTO od) throws Exception{
		return ss.selectList("admin.orderListView", od);
	}	
	//  배송상태
	public void deliveryStatus(OrderDTO od) throws Exception{
		ss.update("admin.deliveryStatus",od);
	}
	//  상품 수량 조절
	public void changeStock(ProductDTO pd) throws Exception{
		ss.update("admin.changeStock",pd);
	}
	//	모든 상품평 조회
	public List<PdtCmtListDTO> cmtAll() throws Exception{
		return ss.selectList("admin.cmtAll");
	}
	//  상품평 삭제
	public void adDeleteCmt(int cmtPdtNum) throws Exception{
		ss.delete("admin.adDeleteCmt",cmtPdtNum);
	}
	
	
}
