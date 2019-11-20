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
				<form action="${path}/admin/pdtUpdate" method="get">
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
						<p>${viewPd.pdtDes}</p>
					</div>
					<div>
						<p>썸네일 이미지</p>
						<p>${viewPd.pdtImg}</p>
					</div>
					<div>
						<p>썸네일 이미지</p>
						<p>${viewPd.pdtThumbNail}</p>
					</div>
					
					<button type="submit" class="btn btn-success">수정</button>
					<button id="btn_delete" type="button" onclick="location.href('${path}/admin/pdtDelete?viewPd=${viewPd.pdtNum}')" class="btn btn-danger">삭제</button>
				</form>
			</div>
		<div class="footer_ad">
		
		</div>
	</body>
</html>