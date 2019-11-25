package com.fila.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class OrderDetailDTO {
	private String orderDetailsNum;
	private String orderId;
	private int pdtNum;
	private int cartVolume;
}
