package com.fila.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class OrderDTO {
	private String orderId;
	private String userId;
	private String orderTo;
	private String userAdd1;
	private String userAdd2;
	private String userAdd3;
	private String userTel;
	private int totalPrice;
	private String rgdate;
}
