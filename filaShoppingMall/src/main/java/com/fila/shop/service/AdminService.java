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
	
	public List<CategoryDTO> category() throws Exception{
		return dao.category();
	}
	
	public void pdtRegister(ProductDTO pd) throws Exception{
		dao.pdtRegister(pd);
	}
}
