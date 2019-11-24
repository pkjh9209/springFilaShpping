package com.fila.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class PdtCmtListDTO {
	private int pdtNum;
	private String userId;
	private int cmtPdtNum;
	private String cmtDes;
	private String rgdate;	
}
