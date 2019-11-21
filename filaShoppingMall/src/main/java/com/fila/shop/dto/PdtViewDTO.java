package com.fila.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class PdtViewDTO {
	private int pdtNum;
	private String pdtName;
	private String cateName;
	private int pdtPrice;
	private String pdtDes;
	private String pdtVolume;
	private String pdtImg;
	private String pdtThumbNail;
	private String rgdate;
	
	private String cateCode;
	private String cateCodeRef;
}
