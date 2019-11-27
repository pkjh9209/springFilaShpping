<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>FILA-상품페이지</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/mall/mallView.css">
	<script type="text/javascript">
	function pdtCmtList() {
		
		var pdtNum = ${viewPd.pdtNum};
		$.getJSON("/shop/mall/mallView/pdtCmtList" + "?pdtCode=" + pdtNum, function(data){
			var str = "";
			$(data).each(function(){
			  	
				var rgdate = new Date(this.rgdate);
				rgdate = rgdate.toLocaleDateString("ko-US")
				  
				str += "<li class='cmt_list' data-pdtNum='" + this.pdtNum + "'>"
				    + "<div class='userInfo'>"
				    + "<i class='fas fa-user-circle user_cmt_icon'></i>"
				    + "<span class='userName'>" + this.userId + "</span>"
				    + "<span class='date'>" + rgdate + "</span>"
				    + "<button type='button' class='delete_btn' data-cmtPdtNum='" + this.cmtPdtNum + "'><i class='fas fa-trash-alt'></i></button>"
				    + "<button type='button' class='update_btn' data-cmtPdtNum='" + this.cmtPdtNum + "'><i class='fas fa-pen'></i></button>"
				    + "</div>"
				    + "<div class='replyContent'>" + this.cmtDes + "</div>"
				    
				    + "<div class='replyFooter'>"
				    + "</div>"
				    
				    + "</li>";           
			});
			$(".pdtCmtList ul").html(str);
		});
	}
</script>
</head>
<body>
	<%@include file ="../common/nav.jsp" %>
	<div class="section01">
		<div class="pdt_img">
			<img src="${path}${viewPd.pdtImg}" alt="썸네일 이미지">
		</div>
		<div class="pdt_info">
			<div class="pdt_name">
				<h1>${viewPd.pdtName}</h1>
				<hr>
			</div>
			<div class="mr15">
				<p class="pdt_info_tt">상품 가격</p>
				<p class="pdt_price ft-size-24"><fmt:formatNumber pattern="###,###,###" value="${viewPd.pdtPrice}" /> won</p>
			</div>
			<div class="mr15">
				<p class="pdt_info_tt">제품 번호</p>
				<p class="pd-5">${viewPd.pdtNum}</p>
			</div>
			<div class="mr15">
				<p class="pdt_info_tt">재고 수량</p>
				<p class="pd-5">${viewPd.pdtVolume} 개</p>
			</div>
			<div class="cartStock mr15">
			<p class="pdt_info_tt">구매 수량</p>
				<button type="button" class="plus">+</button>
				<input type="number" class="numBox" min="1" max="${viewPd.pdtVolume}" value="1" readonly="readonly"/>
				<button type="button" class="minus">-</button>
				<script>
					$(".plus").click(function(){
						var num = $(".numBox").val();
						var plusNum = Number(num) + 1;
					  
						if(plusNum >= 100) {
							$(".numBox").val(num);
						} else {
							$(".numBox").val(plusNum);          
						}
					});
					  
					$(".minus").click(function(){
						var num = $(".numBox").val();
						var minusNum = Number(num) - 1;
					  
						if(minusNum <= 0) {
							$(".numBox").val(num);
						} else {
							$(".numBox").val(minusNum);          
						}
					});
				</script>
			</div>
		<hr>
		<div class="total_price_wp">
			<span class="total_price_01">총결제 금액</span> 
			<span class="total_price_02"><fmt:formatNumber pattern="###,###,###" value="${viewPd.pdtPrice}" /> 원</span>
		</div>
		<div class="addToCart">
			<button class="cart_btn" type="button">카트에 담기</button>
			<script type="text/javascript">
				$(".cart_btn").click(function(){
					var pdtNum = $("#pdt_num").val();
					var cartVolume = $(".numBox").val();
					   
					var data = {
							pdtNum : pdtNum,
							cartVolume : cartVolume
					  };
					
					$.ajax({
							url : "/shop/mall/mallView/insertCart",
							type : "post",
							data : data,
							success : function(result){
								if(result == 1){
									alert("카트 담기 성공");
									$(".numBox").val("1");
								}else{
									alert("로그인후 이용해주세요");
									$(".numBox").val("1");
								}
						},
						error : function(){
							alert("관리자에게 문의해주세요");
						}
					});
				});
							</script>
			<button class="buy_btn" type="button">바로 결제하기</button>
			
		</div>
		</div>
	</div>
	<div class="info_content">
		<p>상품 소개</p>
		<div>${viewPd.pdtDes}</div>
	</div>
	<div class="cmt_content" id="reply">
		<c:if test="${user == null }">
			<p>소감을 남기시려면 <a href="${path}/member/loginMember">로그인</a>해주세요</p>
		</c:if>
		<c:if test="${user != null}">
		<div class="replyForm">
			<form id="cmt_form" method="post" autocomplete="off">
				<input id="pdt_num" type="hidden" name="pdtNum" value="${viewPd.pdtNum}" readonly="readonly">
				<i class="fas fa-user-circle user_icon"></i> <p class="user_id"> ${user.userId}</p>
				<div class="input_area">
					<textarea class="form-control" id="cmtDes" name="cmtDes"></textarea>
				</div>
				<div class="input_area">
					<button type="button" class="btn btn-primary comment_btn" id="comment_btn">소감 남기기</button>
					<script>
						$("#comment_btn").click(function(){
						 
						var formObj = $("#cmt_form");
						var pdtNum = $("#pdt_num").val();
						var cmtDes = $("#cmtDes").val()
						 
							var data = {
								pdtNum : pdtNum,
								cmtDes : cmtDes
							};
						 
							$.ajax({
								url : "/shop/mall/mallView/insertCmt",
								type : "post",
								data : data,
								success : function(){
									pdtCmtList();
									$(cmtDes).val("");
								},
								error : function(e){
									  alert("관리자에게 문의해주세요.");
							    }
							});
							
						});
					</script>
				</div>
			</form>
		</div>
		<hr>
		</c:if>
		<div class="pdtCmtList">
			<h1 class="cmt_title">User Comment</h1>
			<ul>
			</ul> 
			<script type="text/javascript">
				pdtCmtList();
			</script>
			<script type="text/javascript">
				$(document).on("click",".delete_btn",function(){
					var deletConfirm = confirm("삭제하신 댓글은 복구할수 없습니다.");
					var data = {cmtPdtNum : $(this).attr("data-cmtPdtNum")};
					
					if(deletConfirm){
						$.ajax({
							url : "/shop/mall/mallView/deletePdtCmt",
							type : "post",
							data : data,
							success : function(result){
								if(result == 1){
									pdtCmtList(result);	
								}else{
									alert("본인이 작성한 댓글만 삭제가 가능합니다.");
								}
								
							},
							error : function(e){
								  alert("관리자에게 문의해주세요.");
						    }
						});
					}
				});
			</script>  
		</div>
	</div>
</body>
</html>
