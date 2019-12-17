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
	<%@include file ="adminNav.jsp" %>
	<div class="pd-rt-120 col-sm-9 float-right">
		<div>
			<p class="mt-t10">FLIA ADMIN PAGE</p>
			<h1 class="ad_page_in">관리자 페이지 - 상품평관리</h1>
		</div>
		<hr>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">작성자</th>
						<th scope="col">내용</th>
						<th scope="col">상품페이지</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allCmt}" var="allCmt">
						<tr>
							<td>${allCmt.userId}</td>
							<td>${allCmt.cmtDes}</td>
							<td><a href="${path}/mall/mallView?pdtCode=${allCmt.pdtNum}">바로가기</a></td>
							<td>		 
								<form role="form" method="post">
								<input type="hidden" name="repNum" value="${allCmt.cmtPdtNum}" />
								<button type="submit" class="delete_${allCmt.cmtPdtNum}_btn btn btn-danger">삭제</button>
								</form>
							</td>
						</tr>    
					</c:forEach>
				</tbody>
			</table>
	</div>
</body>
</html>
