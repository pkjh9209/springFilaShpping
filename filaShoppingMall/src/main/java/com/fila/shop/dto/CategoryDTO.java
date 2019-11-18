package com.fila.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class CategoryDTO {
	private String cateName;
	private int cateCode;
	private int cateCodeRef;
	private int level;
}
