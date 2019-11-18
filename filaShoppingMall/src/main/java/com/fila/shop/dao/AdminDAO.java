package com.fila.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fila.shop.dto.CategoryDTO;
@Repository
public class AdminDAO {
	
	@Autowired SqlSession ss;
	public List<CategoryDTO> category() throws Exception{
		return ss.selectList("admin.category");
	}
	
}
