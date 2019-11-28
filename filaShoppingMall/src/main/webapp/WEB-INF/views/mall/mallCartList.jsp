<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>fila-main</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/mall/mallCartList.css">
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
										location.href = "/shop/mall/mallCartList";
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
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col"></th>
						<th scope="col">사진</th>
						<th scope="col">상품명</th>
						<th scope="col">상품금액</th>
						<th scope="col">구입수량</th>
						<th scope="col">최종금액</th>
						<th scope="col">개별삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cartList}" var="cartList">
						<tr>
							<th scope="row">
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
							</th>
							<td>
								<div class="thumb"><img src="${path}${cartList.pdtThumbNail}" /></div>
							</td>
							<td>
								${cartList.pdtName}
							</td>
							<td>
								<fmt:formatNumber pattern="###,###,###" value="${cartList.pdtPrice}" />
							</td>
							<td>
								${cartList.cartVolume}
							</td>
							<td>
								<fmt:formatNumber pattern="###,###,###" value="${cartList.pdtPrice * cartList.cartVolume}" />
						    </td>
						    <td>
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
														location.href = "/shop/mall/mallCartList";
													} else {
														alert("삭제 실패");
													}
												}
											});
										}
										
									});
									</script>
								</div>
							</td>
						</tr>
						<c:set var="sum" value="${sum + (cartList.pdtPrice * cartList.cartVolume)}" />
					</c:forEach>
				</tbody>
			</table>
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
					
					<input type="text" name="userAdd1" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="userAdd2" id="sample4_roadAddress" placeholder="도로명주소">
					<input type="text" name="userAdd3" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
					    function sample4_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                var roadAddr = data.roadAddress; // 도로명 주소 변수
					                var extraRoadAddr = ''; // 참고 항목 변수
					
					                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					                    extraRoadAddr += data.bname;
					                }
					                if(data.buildingName !== '' && data.apartment === 'Y'){
					                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                }
					                if(extraRoadAddr !== ''){
					                    extraRoadAddr = ' (' + extraRoadAddr + ')';
					                }
					
					                document.getElementById('sample4_postcode').value = data.zonecode;
					                document.getElementById("sample4_roadAddress").value = roadAddr;
					                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
					                
					                if(roadAddr !== ''){
					                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
					                } else {
					                    document.getElementById("sample4_extraAddress").value = '';
					                }
					
					                var guideTextBox = document.getElementById("guide");
					                if(data.autoRoadAddress) {
					                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
					                    guideTextBox.style.display = 'block';
					
					                } else if(data.autoJibunAddress) {
					                    var expJibunAddr = data.autoJibunAddress;
					                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
					                    guideTextBox.style.display = 'block';
					                } else {
					                    guideTextBox.innerHTML = '';
					                    guideTextBox.style.display = 'none';
					                }
					            }
					        }).open();
					    }
					</script>
					
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
