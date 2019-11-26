package com.fila.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class OrderListDTO {
	private String orderId;
	private String userId;
	private String orderTo;
	private String userAdd1;
	private String userAdd2;
	private String userAdd3;
	private String orderTel;
	private int totalPrice;
	private String rgdate;
	
	private int pdtNum;
	private int orderDetailsNum;
	private int cartVolume;

	private String pdtName;
	private String pdtThumbNail;
	private int pdtPrice;
	
	private String deliveryStatus;
}
