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
			<div class="pd-rt-120 col-sm-9 float-right">
					<div>
						<p class="mt-t10">FLIA ADMIN PAGE</p>
						<h1 class="ad_page_in">관리자 페이지 - 상품조회</h1>
					</div>
					<hr>
				<form id="viewForm" action="${path}/admin/pdtUpdate" method="post" autocomplete="off">
					<div class="wh-50 mb-9 float-left pd-lr-20"> 
						<label>1차 분류</label>
						<span class="category1 form-control">${viewPd.pdtSection}</span>  
					</div>
					<div class="wh-50 mb-9 float-left pd-lr-20">       
						<label>2차 분류</label>
						<span class="category2 form-control">${viewPd.cateName}</span>
					</div>
					<input type="hidden" name="pdtNum" value="${viewPd.pdtNum}" readonly="readonly">					
					<div class="pd-lr-20">
						<p>제품번호</p>
						<p class="form-control">${viewPd.pdtNum}</p>
					</div>
					<div class="pd-lr-20">
						<p>상품명</p>
						<p class="form-control">${viewPd.pdtName}</p>
					</div>
					<div class="pd-lr-20">
						<p>상품 수량</p>
						<p class="form-control">${viewPd.pdtVolume}</p>
					</div>
					<div class="pd-lr-20">
						<p>상품 가격</p>
						<p class="form-control">${viewPd.pdtPrice}</p>
					</div>
					<div class="pd-lr-20">
						<p>상품 소개</p>
						<div>${viewPd.pdtDes}</div>
					</div>
					<div class="pd-lr-20">
						<p>원본 이미지</p>
						<img src="${path}${viewPd.pdtImg}" alt="썸네일 이미지">
						<p>${viewPd.pdtImg}</p>
					</div>
					<div class="pd-lr-20">
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
								var con = confirm("정말로 삭제 하시겠습니까?")
								
								if(con){
									formObj.attr("action", "/shop/admin/pdtDelete");
									formObj.submit();
								}
							});
						</script>
				    </div>
				</form>
			</div>
		<div class="footer_ad">
		
		</div>
	</body>
</html>