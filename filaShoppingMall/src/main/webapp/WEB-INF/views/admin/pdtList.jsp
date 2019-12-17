<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILA-로그인</title>
<%@include file ="../common/head.jsp" %>
<!-- ck에디터 -->
<script src="${path}/resources/ckeditor/ckeditor.js"></script>
</head>
	<body>
		<%@include file ="adminNav.jsp" %>
		<div class="container_ad col-sm-9 float-right">
			<div>
				<p class="mt-t10">FLIA ADMIN PAGE</p>
				<h1 class="ad_page_in">관리자 페이지 - 상품리스트</h1>
			</div>
			<hr>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">제품번호</th>
						<th scope="col">제품명</th>
						<th scope="col">카테고리</th>
						<th scope="col">가격</th>
						<th scope="col">수량</th>
						<th scope="col">등록날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<th scope="row">${list.pdtNum}</th>
							<td><a href="${path}/admin/pdtView?pdtNum=${list.pdtNum}">${list.pdtName}</a></td>
							<td>${list.cateCode}</td>
							<td>${list.pdtPrice}</td>
							<td>${list.pdtVolume}</td>
							<td>${list.rgdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="footer_ad">
		
		</div>
	</body>
</html>