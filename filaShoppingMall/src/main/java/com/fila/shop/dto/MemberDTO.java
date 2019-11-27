package com.fila.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	private String userId;
	private String userPw;
	private String userName;
	private String userTel;
	private String userBirth;
	private String userAdd1;
	private String userAdd2;
	private String userAdd3;
	private String rgdate;
	private int verify;
}
