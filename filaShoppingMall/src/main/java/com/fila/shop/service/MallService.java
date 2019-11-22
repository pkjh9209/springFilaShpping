package com.fila.shop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fila.shop.dao.MallDAO;
import com.fila.shop.dto.PdtViewDTO;
import com.fila.shop.dto.ProductDTO;

@Service
public class MallService {
	
	@Autowired
	private MallDAO dao;
	
	public List<PdtViewDTO> list(int cateCodeRef) throws Exception{
		return dao.list(cateCodeRef);
	}
	
	public ProductDTO mallView(int pdtCode) throws Exception{
		return dao.mallView(pdtCode);
	}
}
