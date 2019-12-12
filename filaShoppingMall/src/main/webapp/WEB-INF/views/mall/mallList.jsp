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
	<div class="page_navigater">

			<c:forEach items="${subNav}" var="subNav">
				<a href="${path}/mall/mallList?pdtCode=${subNav.pdtNum}" class="sub_menu">${subNav.cateName}</a>
			</c:forEach>

	</div>
	<div class="section">
		<h1>${tt}</h1>
		<ul class="pdt_list">
			<c:forEach items="${list}" var="list">
				<li>
					<div class="pdt_thu_wp">
						<div class="pdt_htu">
							<a href="${path}/mall/mallView?pdtCode=${list.pdtNum}"><img src="${path}${list.pdtThumbNail}"></a>
						</div>
						<div class="pdt_content">
							<a href="${path}/mall/mallView?pdtCode=${list.pdtNum}">${list.pdtName}</a>
							<a href="${path}/mall/mallView?pdtCode=${list.pdtNum}">
								<fmt:formatNumber pattern="###,###,###" value="${list.pdtPrice}" /> 원
							</a>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
