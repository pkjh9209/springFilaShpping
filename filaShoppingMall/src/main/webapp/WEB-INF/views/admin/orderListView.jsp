<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>fila-main</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/mall/mallList.css">
	<link rel="stylesheet" href="${path}/resources/css/admin/adOrderList.css">
</head>
<body>
	<%@include file ="adminNav.jsp" %>
	<div class="pd-rt-120 col-sm-9 float-right">
		<div>
			<p class="mt-t10">FLIA ADMIN PAGE</p>
			<h1 class="ad_page_in">관리자 페이지 - 주문목록 상세보기</h1>
		</div>
		<hr>
		<div class="order_tt"><p>주문정보</p></div>
		<div class="detailInfo">
			<c:forEach items="${orderListView}" var="orderListView" varStatus="status">
				<c:if test="${status.first}">
					<div class="info_tt">주문자</div><span>${orderListView.userId}</span><br/>
					<div class="info_tt">수령인</div><span>${orderListView.orderTo}</span><br/>
					<div class="info_tt">주소</div><span>(${orderListView.userAdd1}) ${orderListView.userAdd2} ${orderListView.userAdd3}</span><br/>
					<div class="info_tt">주문 합계</div><span><fmt:formatNumber pattern="###,###,###" value="${orderListView.totalPrice}" /> 원</span><br/>
					<div class="info_tt">배송상태</div><span>${orderListView.deliveryStatus}</span><br/>
					<div class="deliveryChange">
						<form role="form" method="post" class="deliveryForm">
							<input type="hidden" name="orderId" value="${orderListView.orderId}" />
							<input type="hidden" name="deliveryStatus" class="delivery" value="" />
						</form>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">사진</th>
					<th scope="col">상품명</th>
					<th scope="col">개당 가격</th>
					<th scope="col">구입 수량</th>
					<th scope="col">합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderListView}" var="orderListView">   
					<tr>
						<td><img class="pdt_img" src="${path}${orderListView.pdtThumbNail}" /></td>
						<td>${orderListView.pdtName}</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${orderListView.pdtPrice}" /> 원</td>
						<td>${orderListView.cartVolume} 개</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${orderListView.pdtPrice * orderListView.cartVolume}" /> 원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="order_tt"><p>배송상태 설정</p></div>
		<button type="button" class="delivery1_btn btn btn-primary">배송중</button>
		<button type="button" class="delivery2_btn btn btn-secondary">배송완료</button>
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
	</div>
</body>
</html>
