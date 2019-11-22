<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<title>FILA-상품페이지</title>
	<%@include file ="../common/head.jsp" %>
</head>
<body>
	<%@include file ="../common/nav.jsp" %>
	<div>
	<div>
		<p>원본 이미지</p>
		<img src="${path}${viewPd.pdtImg}" alt="썸네일 이미지">
		<p>${viewPd.pdtImg}</p>
	</div>
	<div class="section">
		상품조회페이지
	</div>
	<div>
		<p>제품번호</p>
		<p>${viewPd.pdtNum}</p>
	</div>
	<div>
		<p>상품명</p>
		<p>${viewPd.pdtName}</p>
	</div>
	<div>
		<p>상품 수량</p>
		<p>${viewPd.pdtVolume}</p>
	</div>
	<div>
		<p>상품 가격</p>
		<p>${viewPd.pdtPrice}</p>
	</div>
	</div>
	<div>
		<p>상품 소개</p>
		<div>${viewPd.pdtDes}</div>
	</div>

	<div>
		<p>썸네일 이미지</p>
		<img src="${path}${viewPd.pdtThumbNail}" alt="썸네일 이미지">
		<p>${viewPd.pdtThumbNail}</p>
	</div>
</body>
</html>
