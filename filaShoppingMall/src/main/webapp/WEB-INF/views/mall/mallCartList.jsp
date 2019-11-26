<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>fila-main</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/mall/mallList.css">
	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
	<%@include file ="../common/nav.jsp" %>
	<div class="page_navigater"></div>
	<div class="section">
		<ul>
			<li>
				<div class="allCheck">
					<input type="checkbox" name="allCheck" id="allCheck" />
					<label for="allCheck">모두 선택</label>
					<script>
						$("#allCheck").click(function() {
							var chk = $("#allCheck").prop("checked");
							if (chk) {
								$(".chBox").prop("checked", true);
							} else {
								$(".chBox").prop("checked", false);
							}
						});
					</script>
				</div>
				<div class="delBtn">
					<button type="button" class="selectDelete_btn">선택 삭제</button>
					<script type="text/javascript">
					 $(".selectDelete_btn").click(function(){
						var confirm_val = confirm("정말 삭제하시겠습니까?");

						if(confirm_val) {
							var checkArr = new Array();
						 
							$("input[class='chBox']:checked").each(function(){
								checkArr.push($(this).attr("data-cartNum"));
							});
						  
							$.ajax({
								url : "/shop/mall/deleteCart",
								type : "post",
								data : { chbox : checkArr },
								success : function(result){
									
								 	if(result == 1) {          
										location.href = "/shop/mall/listCart";
									} else {
										alert("삭제 실패");
									}
								}
							});
						} 
					 });
					</script>
				</div>
			</li>
			<c:set var="sum" value="0" />
			<c:forEach items="${cartList}" var="cartList">
				<li>
					<div class="checkBox">
						<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
						<script type="text/javascript">
							$("#allCheck").click(function() {
								var chk = $("#allCheck").prop("checked");
								if (chk) {
									$(".chBox").prop("checked", true);
								} else {
									$(".chBox").prop("checked", false);
								}
							});
						</script>
					</div>
					<div class="thumb">
						<img src="${path}${cartList.pdtThumbNail}" />
					</div>
					<div class="pdtInfo">
						<span>상품명 : </span>${cartList.pdtName}<br /> 
						<span>개당 가격: </span>
						<fmt:formatNumber pattern="###,###,###" value="${cartList.pdtPrice}" /><br />
						<span>구입 수량 : </span>${cartList.cartVolume}<br />
						<span>최종가격 : </span>
						<fmt:formatNumber pattern="###,###,###" value="${cartList.pdtPrice * cartList.cartVolume}" />
					</div>
					<div class="cart_delete">
						<button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button>
						<script type="text/javascript">
							$(".delete_${cartList.cartNum}_btn").click(function(){
								
								var confirm_val = confirm("정말 삭제하시겠습니까?");
								
								if(confirm_val) {
									var checkArr = new Array();
								  
									checkArr.push($(this).attr("data-cartNum"));
								             
									$.ajax({
										url : "/shop/mall/deleteCart",
										type : "post",
										data : { chbox : checkArr },
										success : function(result){
											if(result == 1) {            
												location.href = "/shop/mall/listCart";
											} else {
												alert("삭제 실패");
											}
										}
									});
								}
								
							});
						</script>
					</div>
				</li>
				<c:set var="sum" value="${sum + (cartList.pdtPrice * cartList.cartVolume)}" />
			</c:forEach>
		</ul>
		<div class="listResult">
			<div class="sum">
				총 합계 :<fmt:formatNumber pattern="###,###,###" value="${sum}" />원
			</div>
			<div class="orderOpne">
				<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
			</div>
			<div class="orderInfo">
				<form role="form" method="post" autocomplete="off">
				   
					<input type="hidden" name="totalPrice" value="${sum}" />
					  
					<div class="inputArea">
						<label for="">수령인</label>
						<input type="text" name="orderTo" id="orderTo" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="orderPhon">수령인 연락처</label>
						<input type="text" name="orderTel" id="orderTel" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="userAddr1">우편번호</label>
						<input type="text" name="userAdd1" id="userAdd1" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="userAddr2">1차 주소</label>
						<input type="text" name="userAdd2" id="userAdd2" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="userAddr3">2차 주소</label>
						<input type="text" name="userAdd3" id="userAdd3" required="required" />
					</div>
					
					<div class="inputArea">
						<button type="submit" class="order_btn">주문</button>
						<button type="button" class="cancel_btn">취소</button> 
					</div>
					<script type="text/javascript">
						$(".orderOpne_bnt").click(function(){
							$(".orderInfo").slideDown();
							$(".orderOpne_bnt").slideUp();
						});
						$(".cancel_btn").click(function(){
							$(".orderOpne_bnt").slideDown();
							$(".orderInfo").slideUp();
						});
					</script>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
