package com.fila.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	private int pdtNum;
	private String pdtName;
	private String cateCode;
	private int	pdtVolume;
	private int pdtPrice;
	private String pdtDes;
	private String pdtImg;
	private String pdtSection;
	private String pdtThumbNail;
	private String rgdate;
}
