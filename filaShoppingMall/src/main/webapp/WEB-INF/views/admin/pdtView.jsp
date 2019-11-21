<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILA-로그인</title>
<%@include file ="../common/head.jsp" %>
</head>
	<body>
		<%@include file ="adminNav.jsp" %>
			<div class="container_ad col-sm-9 float-right">
				<h1>상품 조회 페이지</h1>
				<form id="viewForm" action="${path}/admin/pdtUpdate" method="post" autocomplete="off">
					<div class="inputArea"> 
						<label>1차 분류</label>
						<span class="category1">${viewPd.pdtSection}</span>        
						<label>2차 분류</label>
						<span class="category2">${viewPd.cateName}</span>
					</div>
				
					<input type="hidden" name="pdtNum" value="${viewPd.pdtNum}" readonly="readonly">					
					<div>
						<p>제품번호</p>
						<p>${viewPd.pdtNum}</p>
					</div>
					<div>
						<p>상품명</p>
						<p>${viewPd.pdtName}</p>
					</div>
					<div>
						<p>상품 수량</p>
						<p>${viewPd.pdtVolume}</p>
					</div>
					<div>
						<p>상품 가격</p>
						<p>${viewPd.pdtPrice}</p>
					</div>
					<div>
						<p>상품 소개</p>
						<div>${viewPd.pdtDes}</div>
					</div>
					<div>
						<p>원본 이미지</p>
						<img src="${path}${viewPd.pdtImg}" alt="썸네일 이미지">
						<p>${viewPd.pdtImg}</p>
					</div>
					<div>
						<p>썸네일 이미지</p>
						<img src="${path}${viewPd.pdtThumbNail}" alt="썸네일 이미지">
						<p>${viewPd.pdtThumbNail}</p>
					</div>
					
					<div class="inputArea">
						<button type="button" id="update_Btn" class="btn btn-warning">수정</button>
						<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
	
						<script>
							var formObj = $("#viewForm");
		
							$("#update_Btn").click(function() {
								alert('오나');
								formObj.attr("action", "/shop/admin/pdtUpdate");
								formObj.attr("method", "get")
								formObj.submit();
							});
		
							$("#delete_Btn").click(function() {
								formObj.attr("action", "/shop/admin/delete");
								formObj.submit();
							});
						</script>
				    </div>
				</form>
			</div>
		<div class="footer_ad">
		
		</div>
	</body>
</html>