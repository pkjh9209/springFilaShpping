<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<title>fila-main</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/main.css">
</head>
<body>
	<%@include file ="../common/nav.jsp" %>
	<div class="section">
		<c:if test="">
		
		</c:if>
		<ul>
			<c:forEach items="${list}" var="list">
				<li>
					<div>
						<img src="${path}${list.pdtThumbNail}">
					</div>
					<div>
						<a href="${path}/mall/mallView?pdtCode=${list.pdtNum}">${list.pdtNum}</a>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
