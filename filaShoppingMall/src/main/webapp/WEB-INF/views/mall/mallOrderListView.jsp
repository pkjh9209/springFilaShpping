<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>fila-main</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/mall/mallOderListView.css">
</head>
<body>
	<%@include file ="../common/nav.jsp" %>
	<div class="page_navigater"></div>
	<div class="section">
		<h1>주문자 정보</h1>
		<div class="dateilInfo">
			<c:forEach items="${orderView}" var="orderView" varStatus="status">
				<c:if test="${status.first}">
					<p><span>수령인</span>${orderView.orderTo}</p>
					<p><span>주소</span>(${orderView.userAdd1}) ${orderView.userAdd2} ${orderView.userAdd3}</p>
					<p><span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.totalPrice}" /> 원</p>
				</c:if>
			</c:forEach>
		</div>
		
		<table class="table pdt_list text-center" style="font-size:14px;">
			<thead class="thead-dark orderView">
				<tr>
					<th scope="col">이미지</th>
					<th scope="col">상품명</th>
					<th scope="col">개당 가격</th>
					<th scope="col">구입 수량</th>
					<th scope="col">최종 가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderView}" var="orderView">     
					<tr>
						<td><img src="${path}${orderView.pdtThumbNail}" /></td>
						<td>${orderView.pdtName}</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${orderView.pdtPrice}" /> 원</td>
						<td>${orderView.cartVolume} 개</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${orderView.pdtPrice * orderView.cartVolume}" /> 원 </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
