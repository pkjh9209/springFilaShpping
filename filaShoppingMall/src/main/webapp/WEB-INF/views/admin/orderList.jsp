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
	어드민 주문목록
		<ul class="orderList">
		 <c:forEach items="${orderList}" var="orderList">
		 <li>
		 <div>
		  <p><span>주문번호</span><a href="${path}/admin/orderListView?orderCode=${orderList.orderId}">${orderList.orderId}</a></p>
		  <p><span>주문자</span>${orderList.userId}</p>
		  <p><span>수령인</span>${orderList.orderTo}</p>
		  <p><span>주소</span>(${orderList.userAdd1}) ${orderList.userAdd2} ${orderList.userAdd3}</p>
		  <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.totalPrice}" /> 원</p>
		  <p><span>배송상태</span>${orderList.deliveryStatus}</p>
		 </div>
		 </li>
		 </c:forEach>
		</ul>
	</div>
</body>
</html>
