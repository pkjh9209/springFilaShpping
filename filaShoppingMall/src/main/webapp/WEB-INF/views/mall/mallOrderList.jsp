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
	<div class="section">
		<table class="table pdt_list text-center" style="font-size:14px;">
			<thead class="thead-dark">
				<tr>
					<th scope="col">주문번호</th>
					<th scope="col">수령인</th>
					<th scope="col">주소</th>
					<th scope="col">주문자 전화번호</th>
					<th scope="col">가격</th>
					<th scope="col">배송상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderList}" var="orderList">
					<tr>
						<td><a href="${path}/mall/mallOrderListView?orderCode=${orderList.orderId}">${orderList.orderId}</a></td>
						<td>${orderList.orderTo}</td>
						<td>(${orderList.userAdd1}) ${orderList.userAdd2} ${orderList.userAdd3}</td>
						<td>${orderList.orderTel}</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${orderList.totalPrice}" /> 원</td>
						<td>${orderList.deliveryStatus}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
