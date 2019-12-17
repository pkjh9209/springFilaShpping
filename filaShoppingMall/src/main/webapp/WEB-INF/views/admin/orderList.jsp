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
	<%@include file ="adminNav.jsp" %>
	<div class="pd-rt-120 col-sm-9 float-right">
		<div>
			<p class="mt-t10">FLIA ADMIN PAGE</p>
			<h1 class="ad_page_in">관리자 페이지 - 주문목록</h1>
		</div>
		<hr>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">주문번호</th>
					<th scope="col">주문자</th>
					<th scope="col">수령인</th>
					<th scope="col">주소</th>
					<th scope="col">가격</th>
					<th scope="col">배송상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderList}" var="orderList">
					<tr>
						<td><a href="${path}/admin/orderListView?orderCode=${orderList.orderId}">${orderList.orderId}</a></td>
						<td>${orderList.userId}</td>
						<td>${orderList.orderTo}</td>
						<td>(${orderList.userAdd1}) ${orderList.userAdd2} ${orderList.userAdd3}</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${orderList.totalPrice}" /> 원</td>
						<td>${orderList.deliveryStatus}</td>								
					</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div>
</body>
</html>
