<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>fila-main</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/mall/mallList.css">
</head>
<body>
	<%@include file ="../common/nav.jsp" %>
	<div class="page_navigater"></div>
	주문번호 상세보기
	<div class="section">
		<div class="dateilInfo">
			<c:forEach items="${orderView}" var="orderView" varStatus="status">
				<c:if test="${status.first}">
					<p><span>수령인</span>${orderView.orderTo}</p>
					<p><span>주소</span>(${orderView.userAdd1}) ${orderView.userAdd2} ${orderView.userAdd3}</p>
					<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.totalPrice}" /> 원</p>
				</c:if>
			</c:forEach>
		</div>
		<ul class="orderView">
			<c:forEach items="${orderView}" var="orderView">     
				<li>
					<div class="thumb">
						<img src="${path}${orderView.pdtThumbNail}" />
					</div>
					<div class="gdsInfo">
						<span>상품명</span>${orderView.pdtName}<br />
						<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.pdtPrice}" /> 원<br />
						<span>구입 수량</span>${orderView.cartVolume} 개<br />
						<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.pdtPrice * orderView.cartVolume}" /> 원                  
					</div>
				</li>     
			</c:forEach>
		</ul>
	</div>
</body>
</html>
