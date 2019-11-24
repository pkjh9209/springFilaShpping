<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<title>fila-main</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/mall/mallList.css">
</head>
<body>
	<%@include file ="../common/nav.jsp" %>
	<div class="page_navigater"></div>
	<div class="section">
		<ul class="pdt_list">
			<c:forEach items="${list}" var="list">
				<li>
					<div class="pdt_thu_wp">
						<div class="pdt_htu">
							<a href="${path}/mall/mallView?pdtCode=${list.pdtNum}"><img src="${path}${list.pdtThumbNail}"></a>
						</div>
						<div>
							<a href="${path}/mall/mallView?pdtCode=${list.pdtNum}">${list.pdtName}</a>
						</div>
						<div>
							<a href="${path}/mall/mallView?pdtCode=${list.pdtNum}">${list.pdtPrice} 원</a>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>