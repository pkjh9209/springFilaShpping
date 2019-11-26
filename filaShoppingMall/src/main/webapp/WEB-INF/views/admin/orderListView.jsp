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
		주문상세보기 페이지
		<div class="detailInfo">
		  <c:forEach items="${orderListView}" var="orderListView" varStatus="status">
		  
		  <c:if test="${status.first}">
		   <p><span>주문자</span>${orderListView.userId}</p>
		   <p><span>수령인</span>${orderListView.orderTo}</p>
		   <p><span>주소</span>(${orderListView.userAdd1}) ${orderListView.userAdd2} ${orderListView.userAdd3}</p>
		   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderListView.totalPrice}" /> 원</p>
		   <p><span>배송상태</span>${orderListView.deliveryStatus}</p>
		   <div class="deliveryChange">
			 <form role="form" method="post" class="deliveryForm">
			 
			  <input type="hidden" name="orderId" value="${orderListView.orderId}" />
			  <input type="hidden" name="deliveryStatus" class="delivery" value="" />
			  
			  <button type="button" class="delivery1_btn">배송중</button>
			  <button type="button" class="delivery2_btn">배송완료</button>
			  
			  <script>
			   $(".delivery1_btn").click(function(){
			    $(".delivery").val("배송중");
			    run();
			   });
			   
			   $(".delivery2_btn").click(function(){
			    $(".delivery").val("배송완료");
			    run();
			    
			   });
			   
			   function run(){
			    $(".deliveryForm").submit();
			   }
			  </script>
			 </form>
			</div>
		   
		  </c:if>
		  
		 </c:forEach>
		</div>
		<ul class="orderView">
		 <c:forEach items="${orderListView}" var="orderListView">     
		 <li>
		  <div class="thumb">
		   <img src="${path}${orderListView.pdtThumbNail}" />
		  </div>
		  <div class="gdsInfo">
		   <p>
		    <span>상품명</span>${orderListView.pdtNum}<br />
		    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderListView.totalPrice}" /> 원<br />
		    <span>구입 수량</span>${orderListView.cartVolume} 개<br />
		    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderListView.totalPrice * orderListView.cartVolume}" /> 원
		   </p>
		  </div>
		 </li>     
		 </c:forEach>
		</ul>
	</div>
</body>
</html>
