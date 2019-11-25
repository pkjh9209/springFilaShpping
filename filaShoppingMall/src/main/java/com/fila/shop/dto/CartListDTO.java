package com.fila.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class CartListDTO {
	private int cartNum;
	private String userId;
	private int pdtNum;
	private int cartVolume;
	private String rgdate;
	
	private String pdtName;
	private int pdtPrice;
	private String pdtThumbNail;
}
